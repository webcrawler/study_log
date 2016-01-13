using UnityEngine;
using System.Collections;

public class FollowTarget : MonoBehaviour {

	public Transform playerTransform;
	private Vector3 offset;

	// Use this for initialization
	void Start () 
	{
		// transform 为当前组件FollowTarget 所在游戏物体的transform组件 main camera
		offset = transform.position - playerTransform.position;
	}

	// Update is called once per frame
	void Update () 
	{
		// update camera pos
		transform.position = playerTransform.position + offset;
	}
}
