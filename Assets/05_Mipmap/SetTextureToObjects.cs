using UnityEngine;

public class SetTextureToObjects : MonoBehaviour
{
    public Texture2D[] textures;

    private void OnGUI()
    {
        for (int i = 0; i < this.textures.Length; i++)
        {
            if (GUILayout.Button(this.textures[i].name))
            {
                SetTexture(i);
            };
        }
    }

    private void SetTexture(int textureIndex)
    {
        Renderer[] renderers = GameObject.FindObjectsOfType<Renderer>();

        foreach (var renderer in renderers)
        {
            MaterialPropertyBlock material = new MaterialPropertyBlock();
            material.SetTexture("_MainTex", this.textures[textureIndex]);
            renderer.SetPropertyBlock(material);
        }
    }
}