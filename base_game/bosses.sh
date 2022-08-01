#!/bin/bash

function mort_de_ganon() {
    echo ▓ Bravo, tu as tué le vil et maléfique Ganon. Le monde est la princesse est sauvé !!! ▓
    combat_de_link
}

function heal() {
    pv_link=$((pv_link+30))
    if [[ pv_link -gt 59 ]]; then
        pv_link=60
        fi
}

function attaque_link() {
   pv_ganon=$((pv_ganon-15))

}

function attaque_ganon() {
pv_link=$((pv_link-20))

}




#Debut du script

start
magic=1
Attaque=1
Soin=2
pv_link=60
pv_ganon=150
link=0
ganon=0
function combat_de_link() {

echo "▓ Vous rencontrez le puissant GANON ▓"
while [[ $pv_link -gt 0 ]]; do
echo -e "\n◉ Quelle action voulez-vous éffectuer ?\n"

affich_link
affich_ganon

echo ▼ Actions ▼

echo " ► 1.Attaque ◄   ► 2.Soin ◄ "
       read magic
       if [[ $magic -eq $Attaque ]]; then
       echo "▓ Vous attaquez et infligé 15 de Dégats ▓ "
       attaque_link
       fi
       if [[ $magic -eq $Soin ]]; then
           heal
        if [[ $pv_link -gt 60 ]]; then
            echo "▓ Vous êtes dêja à 100% de vos Pv ▓"
        fi
        if [[ $pv_link -lt 60 ]]; then

            echo "▓ Vous prenez une potion et recupéré 30 Pv ▓ "
fi
fi
        if [[ $magic -ne $Attaque && $Soin ]]; then
            attaque_ganon
            echo "▓ Tu as échoué ton action ▓"
            fi
    attaque_ganon
    echo "▓ Vous subissez 20 de dégât par Ganon ▓"
   if [[ $pv_link -le 0 ]]; then
       restart
   fi
   if [[ $pv_bokoblin -le 0 ]]; then
       mort_du_bokoblin
   fi

done
}
combat_de_link
