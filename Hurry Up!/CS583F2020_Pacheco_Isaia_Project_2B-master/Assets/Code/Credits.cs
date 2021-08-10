using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Credits : MonoBehaviour
{
    public Button back;

    void Start()
    {
        back.onClick.AddListener(Back);
    }
    public void Back()
    {
        Debug.Log("Back");
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex - 1);
    }
}
