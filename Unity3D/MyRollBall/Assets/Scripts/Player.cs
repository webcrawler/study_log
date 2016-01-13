using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class Player : MonoBehaviour 
{
	private Rigidbody rd;

	public int force = 5;

	public int score = 0;

	public Text text;

	public GameObject winText;

	// Use this for initialization
	void Start () 
	{
		rd = GetComponent<Rigidbody> ();
	}
	
	// Update is called once per frame
	void Update ()
	{
		// -1 ~ 1 , "a, d" keypad
		float h = Input.GetAxis ("Horizontal");
		// -1 ~ 1 , "w, s" keypad
		float v = Input.GetAxis ("Vertical");
		// 施力
		rd.AddForce (new Vector3(h, 0, v)*force);
	}

	// 碰撞检测
	void OnCollisionEnter(Collision collision)
	{
		// collision.collider 获取碰撞到得游戏物体身上的组件
		string name = collision.collider.name;
		print (name);

		if (collision.collider.tag == "PickUp") 
		{
			Destroy (collision.collider.gameObject);
		}
	}

	// 触发检测
	void OnTriggerEnter(Collider collider)
	{
		if (collider.tag == "PickUp") 
		{
			score++;
			text.text = "score: " + score.ToString ();

			if (score >= 10)
			{
				winText.SetActive (true);
			}

			Destroy (collider.gameObject);
		}
	}
}
