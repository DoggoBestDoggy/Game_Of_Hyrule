#!/bin/bash

#:: DEBUT DU SCRIPT ::

#:MAIN

function start() {
   pv_link=60
    answer=$1
    echo  "╔════════════════════════════════════════════════════╗         
║Incarnez Link et ses amis et continuez votre periple║
║   Vers le Chateau d'Hyrule et terrassez Ganon      ║
╚════════════════════════════════════════════════════╝"
    echo "──▒▒▒▒▒▒▒▒───▒▒▒▒▒▒▒▒──▒▒▒▒▒▒▒▒───▒▒▒▒▒▒▒▒
 ─▒▐▒▐▒▒▒▒▌▒─▒▒▌▒▒▐▒▒▌▒─▒▐▒▐▒▒▒▒▌▒─▒▒▌▒▒▐▒▒▌▒
──▒▀▄█▒▄▀▒───▒▀▄▒▌▄▀▒──▒▀▄█▒▄▀▒───▒▀▄▒▌▄▀▒
─────██─────────██─────────██─────────██
░░░▄▄██▄░░░░░░░▄██▄░░░░░░▄▄██▄░░░░░░░▄██▄░░░"
    echo "◉ Voulez vous entrez dans le château ?"
    echo "►oui   ►non" 
    read answer
    if [[ $answer == "oui" ]]; then
	echo -e  "\n╔═══════════════════════════╗
║Vous entrez dans le château║
╚═══════════════════════════╝"
	echo "         █▄██▄█
█▄█▄█▄█▄█▐█┼██▌█▄█▄█▄█▄█
███┼█████▐████▌█████┼███
█████████▐████▌█████████"
    fi
    if [[ $answer == "non" ]]; then
	exit 1
	fi
}

function start_after_death() {
     echo -e "\n◉ Soyez prudent la prochaine fois ♥"
        start
}

function restart() {
    reponse=$1
    echo "▓ Tu es mort ▓"
    echo " ──▄────▄▄▄▄▄▄▄────▄───
 ─▀▀▄─▄█████████▄─▄▀▀──
 ─────██─▀███▀─██──────
 ───▄─▀████▀████▀─▄────
 ─▀█────██▀█▀██────█▀──"

    echo "◉ Veux-tu recommencer ?"
    echo "►oui     ►non"
    read reponse
    if [[ "$reponse" == "non" ]]; then
        return $0
    fi
    if [[ "$reponse" == "oui" ]]; then
        start_after_death
    fi
}

function mort_du_bokoblin() {
    echo ▓ Bravo, tu as tué un Bokoblin ! ▓ 
    echo -e "\n◉ Veux-tu accéder au prochaine étage ?"
    echo ►oui  ►non
    read response
    if [[ $response == "oui" ]]; then
	affich_bokoblin
	combat_de_link
    fi
    if [[ $response == "non" ]]; then
	return $0
	fi
}

function heal() {
    pv_link=$((pv_link+30))
    if [[ pv_link -gt 59 ]]; then
	pv_link=60
	fi
}

function attaque_link() {
   pv_bokoblin=$((pv_bokoblin-15))
    
}

function attaque_bokoblin() {
    pv_link=$((pv_link-5))
}




#Debut du script

start
magic=1
Attaque=1
Soin=2
pv_link=60
pv_bokoblin=30
link=0
bokoblin=0
etage=1
pv_ganon=150
round=1
function affich_bokoblin_1() {
    bokoblin=0
    while [[ $bokoblin == "0" ]]; do
        if [[ $pv_bokoblin -gt 0 ]]; then
    echo Bokoblin $pv_bokoblin/30 :PV  5 :FRC
    fi
    if [[ $pv_bokoblin -le 0 ]]; then
        etage=$((etage+1))
        echo -e "\n▓ Vous grimpez d'un étage ▓"
        combat_de_link
    fi

        if [[ $etage == "10" ]]; then

            echo -e "\n▓ Vous êtes arrivé dernier étage ▓"
            combat_de_ganon
        fi

    bokoblin=1
    done
}


function combat_de_link() {

    echo -e "\n▓ Vous rencontrez Bokoblin ▓"
    pv_bokoblin=30
while [[ $pv_link -gt 0 ]]; do
    if [[ $pv_bokoblin -le 0 ]]; then
       mort_du_bokoblin
   fi
echo -e "\n◉ Quelle action voulez-vous éffectuer ?"

affich_link
affich_bokoblin_1

echo  -e "\n▼ Actions ▼"

echo -e "\n► 1.Attaque ◄   ► 2.Soin ◄ "
       read magic
       if [[ $magic -eq $Attaque ]]; then
       echo -e "\n▓ Vous attaquez et infligé 15 de Dégats ▓ "
       attaque_link
       fi
       if [[ $magic -eq $Soin ]]; then
	   heal
        if [[ $pv_link -gt 60 ]]; then
            echo -e "\n▓ Vous êtes dêja à 100% de vos Pv ▓"
        fi
	fi
	if [[ $magic -ne $Attaque && $magic -ne $Soin ]]; then
	    echo -e "\n▓ Tu as échoué ton action ▓"
	fi
	attaque_bokoblin
	 if [[ $magic -eq $Soin && $pv_link -lt 60 ]]; then

            echo -e "\n▓ Vous prenez une potion et recupéré 30 Pv ▓ "
        fi
   if [[ $pv_bokoblin -gt 0 ]]; then       
       echo -e "\n▓ Vous subissez 5 de dégât par le Bokoblin ▓"
       fi
   if [[ $pv_link -le 0 ]]; then
       restart
   fi
done  
}

function affich_link() {
    link=0
    while [[ $link == "0" ]]; do
    if [[ $pv_link -gt 0 ]]; then
        echo Link $pv_link/60 :PV  15 :FRC
        link=1
        fi
    done
}
combat_de_link





#ganon



function attaque_link_ganon() {
pv_ganon=$((pv_ganon-15))

}

function attaque_ganon() {
pv_link=$((pv_link-20))

}
function affich_bokoblin() {
    bokoblin=0
    while [[ $bokoblin == "0" ]]; do
        if [[ $pv_bokoblin -gt 0 ]]; then
    echo Bokoblin $pv_bokoblin/30 :PV  5 :FRC
    fi
    if [[ $pv_bokoblin -le 0 ]]; then
        etage=$((etage+1))
        echo -e "\n▓ Vous grimpez d'un étage ▓"
        combat_de_link
    fi

        if [[ $etage == "10" ]]; then

            echo -e "\n▓ Vous êtes arrivé dernier étage ▓"
            combat_de_ganon
        fi

    bokoblin=1
    done
}

function combat_de_ganon() {
  
echo "▓ Vous rencontrez le puissant GanonDorf ▓"
while [[ $pv_link -gt 0 ]]; do
echo -e "\n◉ Quelle action voulez-vous éffectuer ?\n"

affich_link
affich_ganon

echo ▼ Actions ▼

echo " ► 1.Attaque ◄   ► 2.Soin ◄\n "
       read magic
       if [[ $magic -eq $Attaque ]]; then
       echo -e "\n▓ Vous attaquez et infligé 15 de Dégats ▓ "
       attaque_link_ganon
       fi
       if [[ $magic -eq $Soin ]]; then
           heal
        if [[ $pv_link -gt 60 ]]; then
            echo -e "\n▓ Vous êtes dêja à 100% de vos Pv ▓"
        fi
        if [[ $pv_link -lt 60 ]]; then

            echo -e "\n▓ Vous prenez une potion et recupéré 30 Pv ▓ "
fi
fi
        if [[ $magic -ne $Attaque && $magic -ne $Soin ]]; then
            echo -e "\n▓ Tu as échoué ton action ▓"
            fi
    attaque_ganon
    echo -e "\n▓ Vous subissez 20 de dégât par Ganon ▓"
   if [[ $pv_link -le 0 ]]; then
       restart
   fi
   if [[ $pv_ganon -le 0 ]]; then
       mort_de_ganon
   fi

done

}

function affich_bokoblin1() {
    bokoblin=0
    while [[ $bokoblin == "0" ]]; do
        if [[ $pv_bokoblin -gt 0 ]]; then
    echo Bokoblin $pv_bokoblin/30 :PV  5 :FRC
    fi
    if [[ $pv_bokoblin -le 0 ]]; then
        etage=$((etage+1))
        echo -e "\n▓ Vous grimpez d'un étage ▓"
        combat_de_link
    fi

        if [[ $etage == "10" ]]; then

            echo -e "\n▓ Vous êtes arrivé dernier étage ▓"
            combat_de_ganon
        fi

    bokoblin=1
    done
}

combat_de_link

function mort_de_ganon() {
reponse=$1
    echo -e "\n▓ Félicitation ▓"
    echo -e "\n▓ Tu as vaincu le puissant GanonDorf et sauvé Hyrule ▓"
    echo -e "\n◉ Souhaites-tu recommencer"
    echo "►oui     ►non"
    read reponse
    if [[ $reponse == "oui" ]]; then
	start
    fi
    if [[ $reponse == "non" ]]; then
	return $0
}

