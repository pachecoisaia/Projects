using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlueCar : MonoBehaviour
{

    public Rigidbody2D rb;
    float speed = 1f;
    public float minSpeed = 8f;
    public float maxSpeed = 12f;

    // Start is called before the first frame update
    void Start()
    {
        speed = Random.Range(minSpeed, maxSpeed);
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        rb.MovePosition(rb.position + Vector2.left * Time.fixedDeltaTime * speed);

    }

}