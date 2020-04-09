using UnityEngine;

public class LODFallback : MonoBehaviour
{
    public int ShaderLOD = 600;

    private void OnGUI()
    {
        GUILayout.BeginArea(new Rect(0, 0, 200, 100));

        GUILayout.Label("ShaderLOD :" + this.ShaderLOD);

        this.ShaderLOD = (int)GUILayout.HorizontalSlider(this.ShaderLOD, 0, 600);

        GUILayout.EndArea();

        Shader.globalMaximumLOD = this.ShaderLOD;
        // shader.maximumLOD;
    }
}