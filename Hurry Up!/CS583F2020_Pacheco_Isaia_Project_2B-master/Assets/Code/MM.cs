using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class MM : MonoBehaviour
{
    public Button play, credits,quit, tutorial;

    void Start()
    {
        //audioSource = GetComponent<AudioSource>();
        play.onClick.AddListener(PlayGame);
        credits.onClick.AddListener(Credits);
        quit.onClick.AddListener(Quit);
        tutorial.onClick.AddListener(Tutorial);


    }
    public void PlayGame()
    {
        Debug.Log("Play");
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 3);
    }

    public void Credits()
    {
        Debug.Log("Credits");
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
    }

    public void Quit()
    {
        Debug.Log("Quit");
        Application.Quit();
    }
    public void Tutorial()
    {
         Debug.Log("Tutorial");
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 2);
    }

    
}
