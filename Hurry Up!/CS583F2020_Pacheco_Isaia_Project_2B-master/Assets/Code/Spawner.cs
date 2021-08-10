using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Spawner : MonoBehaviour
{
    public float spawnDelay = 1.0f;
    public GameObject[] car;
    public int timetilDestroyClone;
    public AudioSource audiosource;

    public Transform[] sP;
    float nTTs = 0f;
     
    void Start() {
        audiosource = GetComponent<AudioSource>();
        audiosource.Play();
    }

    void Update()
    {
        if (nTTs <= Time.time)
        {
            SpawnCar();
            nTTs = Time.time + spawnDelay;
        }
    }

    void SpawnCar() {
        int randomIndex = Random.Range(0,sP.Length);
        Transform spawnPoint = sP[randomIndex];
        GameObject obj = Instantiate(car[randomIndex], spawnPoint.position, spawnPoint.rotation);
        Destroy(obj, timetilDestroyClone); 
    }
}
