using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[CreateAssetMenu(fileName = "New Adoption Card", menuName = "Adoption Card")]
public class AdoptionCard : ScriptableObject
{
    public new string name;
    public string description;

    public Sprite artwork;

    public int cost;
}
