using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Chicken : MonoBehaviour
{

    public Rigidbody2D body;
    public AudioSource Audiosource;
    public AudioSource Audiosource2;  
    public Animator animator;
    Vector2 up, left, down, right, restart;

    public int numScene;

    public Text winlose;

    // Start is called before the first frame update
    void Start()
    {
        up = new Vector2(0.0f, 0.1f);
        right = new Vector2(0.1f, 0.0f);
        down = new Vector2(0.0f, -0.1f);
        left = new Vector2(-0.1f, 0.0f);
        restart = new Vector2(-0.02f, -3.48f);
        Audiosource = GameObject.FindGameObjectWithTag("LoseSong").GetComponent<AudioSource>();
        Audiosource2 = GameObject.FindGameObjectWithTag("WinSong").GetComponent<AudioSource>();
        winlose.text = "";

    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKey(KeyCode.UpArrow) | Input.GetKey(KeyCode.W) ) {
            body.MovePosition(body.position + up);
            animator.SetBool("U", true);
        }
        else if(Input.GetKey(KeyCode.LeftArrow)| Input.GetKey(KeyCode.A)) {
            body.MovePosition(body.position + left);
            animator.SetBool("L", true);
        }
        else if(Input.GetKey(KeyCode.DownArrow) | Input.GetKey(KeyCode.S)) {
            body.MovePosition(body.position + down);
            animator.SetBool("D", true);
        }
        else if(Input.GetKey(KeyCode.RightArrow) | Input.GetKey(KeyCode.D)) {
            body.MovePosition(body.position + right);
            animator.SetBool("R", true);
        }

        else {
            animator.SetBool("U", false);
            animator.SetBool("L", false);
            animator.SetBool("D", false);
            animator.SetBool("R", false);

        }

    }

    void OnTriggerEnter2D(Collider2D col)
    {
        if(col.tag == "Car")
        {
            Debug.Log("Lost");
            Audiosource.Play();
            winlose.text = "YOU LOST!";
            GameObject lose = GameObject.FindGameObjectWithTag("LoseSong");
            DontDestroyOnLoad(lose);
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex - SceneManager.GetActiveScene().buildIndex);
        }

        else if(col.tag == "Goal")
        {
            Debug.Log("Won");
            Audiosource2.Play();
            winlose.text = "YOU WIN!";
            GameObject win = GameObject.FindGameObjectWithTag("WinSong");
            DontDestroyOnLoad(win);
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex  + numScene);
        

            
        }

    }
}
