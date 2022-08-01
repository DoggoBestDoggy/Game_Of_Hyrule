#!/bin/bash



HP=60
étage=1


function combatBoko(){
    round $i
    hp= -5
if hp=0
   read
}

function heal(){
    if hp -ge 60
    then hp=60
}

function i {0..9}
do combatBoko
done

       
    

display_hp(){
    if [[ -z $2 ]]; then
	echo $1 "/ 60 : HP" $2

	
    fi 
}
display_name(){
    if [[ -z $2 ]]; then
	echo $1  $2
    fi
}


first_line=0

while IFS=';' read -r id name hp mp str int def res spd luck race class rarity; do
    if [[ $first_line -ne 0 ]]; then
	display_name $name
	display_hp $hp
	
    fi
    first_line=1
done < players.csv




magic=1
Attaque=1
Soin=2
pv=60

echo "▓ Vous rencontrez Bokoblin ▓"

echo ◉ Quelle action voulez-vous éffectuer ?

echo ▼ Actions ▼

echo " ► 1.Attaque ◄   ► 2.Soin ◄ "

while [[ $pv -gt 0 ]]; do
read magic
    if [[ $magic -eq $Attaque ]]; then
       echo "▓ Vous attaquez et infligé 15 de Dégats !! ▓ "

    elif [[ $magic -eq $Soin ]]; then
        echo "▓ Vous prenez une potion et recupéré 30 Pv  !! ▓ "
    fi
done
