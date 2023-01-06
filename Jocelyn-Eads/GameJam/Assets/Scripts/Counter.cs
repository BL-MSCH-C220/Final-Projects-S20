using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Counter : MonoBehaviour
{
    public Text counterText;

    public int counter;
    private int costAmount;

    public GameObject container;

    private Button adoptButton;

    // Update is called once per frame
    void Update()
    {
        counterText.text = counter.ToString();

    }


    void FixedUpdate()
    {
        costAmount = container.GetComponentInChildren<AdoptionCardDisplay>().adoptionCard.cost;
        adoptButton = container.GetComponentInChildren<Button>();

        if (costAmount > counter)
        {

            adoptButton.interactable = false;

        }
        else
        {
            adoptButton.interactable = true;
        }
    }


    public void IncreaseCounter()
    {
        counter++; 
    }

    public void DecreaseCounter()
    {
        
        if (costAmount > counter)
        {
            Debug.Log(costAmount);
            return;

        }

        {
            counter -= costAmount;
            Destroy(adoptButton);
        }
    }


}
