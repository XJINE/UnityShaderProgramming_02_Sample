using UnityEngine;

public class PropertyBlock : MonoBehaviour
{
    new public Renderer renderer;
        public Material material;
        public int      instanceID;

    [Range(0, 1)]
    public float floatValue;

    private MaterialPropertyBlock materialPropertyBlock;

    private void Start()
    {
        materialPropertyBlock = new MaterialPropertyBlock();
    }

    void Update ()
    {
        materialPropertyBlock.SetFloat("_FloatValue", floatValue);

        renderer.SetPropertyBlock(materialPropertyBlock);

        instanceID = material.GetInstanceID();
    }
}