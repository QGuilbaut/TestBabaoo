using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;



public class GridManager : MonoBehaviour
{
    public enum StartPosition
    {
        topLeft,
        topCenter,
        toprRight,
        centerLeft,
        center,
        centerRight,
        bottomLeft,
        bottomCenter,
        bottomRight,
    }

    public int gridSizeX = 3;
    public int gridSizeY = 3;
    [SerializeField] GameObject gridParent;
    [SerializeField] GameObject quadPrefab;

    [SerializeField] Material androidMat;
    [SerializeField] Material IOSMat;

    [SerializeField] Material[] androidSprites;
    [SerializeField] Material[] IOSSprites;

    public StartPosition[,] grid;
    private int value = 0;

    // Start is called before the first frame update
    void Start()
    {
        GenerateGrid(gridSizeX, gridSizeY);

    }



    // Update is called once per frame
    void Update()
    {
        for (int i = 0; i < gridParent.transform.childCount; i++)
        {
            int X = i % 3; ;
            int Y = (int)Mathf.Floor(i / 3); ;
            gridParent.transform.GetChild(i).GetComponent<Block>().value = (int)grid[X, Y];

#if UNITY_ANDROID
            gridParent.transform.GetChild(i).GetComponent<Renderer>().material = androidSprites[(int)grid[X, Y]];
#elif UNITY_IOS
            gridParent.transform.GetChild(i).GetComponent<Renderer>().material = IOSSprites[(int)grid[X, Y]];
#endif           

        }
    }


    /// <summary>
    /// Generate a grid of the size passed in parameter.
    /// </summary>
    void GenerateGrid(int sizeX, int sizeY)
    {
        Vector3 position = new Vector3(0.0f, 0.0f, 0.0f);

        grid = new StartPosition[sizeX, sizeY];

        for (int y = 0; y< sizeY; y++)
        {
            for (int x = 0; x < sizeX; x++)
            {
                grid[x, y] = (StartPosition)value;
                GameObject quad = Instantiate(quadPrefab);
                quad.transform.SetParent(gridParent.transform);

                quad.GetComponent<Block>().value = value;

                position.x = x - 1;
                position.y = y - 1;
                quad.transform.localPosition = position;

                value++;
            }
        }
    }
}
