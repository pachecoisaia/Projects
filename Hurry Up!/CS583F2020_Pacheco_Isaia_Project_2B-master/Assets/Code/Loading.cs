using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;


public class Loading : MonoBehaviour
{

    public Text countdown;
    public int spawnDelay;
    public int temp = 0;


    void Start() {
       

    }

    void Update()
    {
        if(temp < spawnDelay) {
            temp++;
        }
        countdown.text = temp.ToString() + "%";
        
        if (temp == spawnDelay) {
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
        }
    
    }


}
