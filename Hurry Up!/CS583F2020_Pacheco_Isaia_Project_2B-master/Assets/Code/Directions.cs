using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class Directions : MonoBehaviour
{
    public float spawnDelay = 3.0f;
    public float nTTs = 0f;
    public Text mytext;
    // Start is called before the first frame update

    void Start()
    {
        mytext.text = "GET TO THE OTHER SIDE";
    }

    // Update is called once per frame
    void Update()
    {
    
    if (nTTs <= Time.time)
        {
            mytext.text = "";
            nTTs = Time.time + spawnDelay;
        }
        
    }
}
