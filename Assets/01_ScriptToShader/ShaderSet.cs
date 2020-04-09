using UnityEngine;

public class ShaderSet : MonoBehaviour
{
    [Range(0, 1)]
    public  float floatValue;

    void Update ()
    {
        Shader.SetGlobalFloat("_FloatValue", floatValue);
    }
}