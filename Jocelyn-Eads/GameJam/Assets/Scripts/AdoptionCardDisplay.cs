using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class AdoptionCardDisplay : MonoBehaviour
{
    public AdoptionCard adoptionCard;

    public Text nameText;
    public Text descriptionText;

    public Image artworkImage;

    public Text costText;

    public Button adoptButton;



    // Start is called before the first frame update
    void Start()
    {
        nameText.text = adoptionCard.name;
        descriptionText.text = adoptionCard.description;

        artworkImage.sprite = adoptionCard.artwork;

        costText.text = adoptionCard.cost.ToString();

    }

   

}
