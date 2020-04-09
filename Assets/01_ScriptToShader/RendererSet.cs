using UnityEngine;

public class RendererSet : MonoBehaviour
{
    new public Renderer renderer;
        public int      instanceID;

    [Range(0, 1)]
    public float floatValue;

    void Update ()
    {
        renderer.material.SetFloat("_FloatValue", floatValue);
        // renderer.sharedMaterial.SetFloat("_FloatValue", floatValue);

        instanceID = renderer.material.GetInstanceID();
    }
}