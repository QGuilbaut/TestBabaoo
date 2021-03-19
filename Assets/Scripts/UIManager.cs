using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class UIManager : MonoBehaviour
{

    [SerializeField] Text timer;
    float seconde = 180;

    [SerializeField] GridManager gridManager;

    [SerializeField] GameObject gridParent;
    [SerializeField] GameObject imagePrefab;

    [SerializeField] Sprite[] androidSprites;
    [SerializeField] Sprite[] IOSSprites;

    List<GameObject> button = new List<GameObject>();

    int selectedValue = -1;
    int selectedID = 0;
    int voidID = 4;

    [SerializeField] Text scoreText;
    int score = 0;

    [SerializeField] GameObject gameEnd;


    // Start is called before the first frame update
    void Start()
    {

        GenerateUIGrid(gridManager.gridSizeX, gridManager.gridSizeY);
        for (int i = 0; i < gridParent.transform.childCount; i++)
        {
            button.Add(gridParent.transform.GetChild(i).gameObject);
        }
        Shuffle();
        while (button[4].GetComponent<Block>().value == 4)
        {
            Shuffle();
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (seconde > 0)
        {
            seconde -= Time.deltaTime;
            timer.GetComponent<Text>().text = "Time Left : " + Mathf.FloorToInt(seconde / 60) + " : " + (int)(seconde % 60);

        }
        else
        {
            timer.GetComponent<Text>().text = "TIME OUT !";
            gridParent.SetActive(false);
            gameEnd.SetActive(true);
        }

    }

    /// <summary>
    /// Generate a grid of the size passed in parameter.
    /// </summary>
    void GenerateUIGrid(int sizeX, int sizeY)
    {
        Vector3 position = new Vector3(0.0f, 0.0f, 0.0f);

        for (int y = 0; y < sizeY; y++)
        {
            for (int x = 0; x < sizeX; x++)
            {
                GameObject button = Instantiate(imagePrefab, gridParent.transform);
                button.GetComponent<Block>().ID = (sizeX * y + x);
                button.GetComponent<Block>().value = (int)gridManager.grid[x, y];

                button.GetComponent<Button>().onClick.AddListener(() => ChangeValue(button.GetComponent<Block>().ID));

                position.x = x * 50;
                position.y = y * -50;
                button.GetComponent<RectTransform>().anchoredPosition = position;


            }
        }
    }

    /// <summary>
    /// Apply the right sprite to each image depending on the OS.
    /// </summary>
    void ChangeSprite()
    {

        for (int i = 0; i < gridParent.transform.childCount; i++)
        {
            int x = i % 3;
            int y = (int)Mathf.Floor(i / 3);
            gridManager.grid[x, y] = (GridManager.StartPosition)button[i].GetComponent<Block>().value;

#if UNITY_ANDROID
            button[i].GetComponent<Image>().sprite = androidSprites[(int)gridManager.grid[x, y]];

#elif UNITY_IOS
            button[i].GetComponent<Image>().sprite = IOSSprites[(int)gridManager.grid[x, y]];
#endif
        }
    }

    public void ChangeValue(int ID)
    {
        if (selectedValue == -1)
        {

            selectedValue = gridParent.transform.GetChild(ID).GetComponent<Block>().value;
            selectedID = ID;
        }
        else
        {
            int newvalue = gridParent.transform.GetChild(ID).GetComponent<Block>().value;
            if (newvalue == 4)
            {
                if (CheckMovement(selectedID) == true)
                {
                    gridParent.transform.GetChild(selectedID).GetComponent<Block>().value = newvalue;
                    gridParent.transform.GetChild(ID).GetComponent<Block>().value = selectedValue;
                    voidID = selectedID;
                    selectedValue = -1;
                    score++;
                    scoreText.GetComponent<Text>().text = "Score : " + score;
                    ChangeSprite();
                    CheckVictory();
                    EventSystem.current.SetSelectedGameObject(null);
                }
                else
                {
                    selectedValue = -1;
                    Debug.Log("wrong tile");
                }
            }
        }
    }
    public void Shuffle()
    {
        for (int h = 0; h < 400; h++)
        {
            int ID = Random.Range(0, 9);

            if (selectedValue == -1)
            {

                selectedValue = gridParent.transform.GetChild(ID).GetComponent<Block>().value;
                selectedID = ID;
            }
            else
            {
                int newvalue = gridParent.transform.GetChild(ID).GetComponent<Block>().value;
                if (newvalue == 4)
                {
                    if (CheckMovement(selectedID) == true)
                    {
                        gridParent.transform.GetChild(selectedID).GetComponent<Block>().value = newvalue;
                        gridParent.transform.GetChild(ID).GetComponent<Block>().value = selectedValue;
                        voidID = selectedID;
                        selectedValue = -1;
                        ChangeSprite();
                    }
                    else
                    {
                        selectedValue = -1;
                        Debug.Log("wrong tile");
                    }
                }
            }

        }
    }

    public bool CheckMovement(int selectID)
    {
        int voidX = voidID % 3;
        int voidY = (int)Mathf.Floor(voidID / 3);

        int selectX = selectID % 3;
        int selectY = (int)Mathf.Floor(selectID / 3);

        for (int x = -1; x <= 1; x++)
        {
            for (int y = -1; y <= 1; y++)
            {
                if (Mathf.Abs(x) != Mathf.Abs(y))
                {
                    if (selectX == voidX - x && selectY == voidY)
                    {
                        return true;
                    }
                    if (selectX == voidX && selectY == voidY - y)
                    {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public void CheckVictory()
    {
        for (int i = 0; i < gridParent.transform.childCount; i++)
        {
            if (gridParent.transform.GetChild(i).GetComponent<Block>().value != i)
            {
                return;
            }
        }
        gameEnd.SetActive(true);
        gameEnd.GetComponent<Text>().text = "VICTORY !";

        if (score < PlayerPrefs.GetInt("Score") || PlayerPrefs.GetInt("Score") == 0)
        {
            PlayerPrefs.SetInt("Score", score);
        }

    }
}
