using UnityEngine;
using System.Collections;

public class PickUp : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		// 每帧围绕y旋转1度
		transform.Rotate (new Vector3(0, 1, 0));
	}
}
