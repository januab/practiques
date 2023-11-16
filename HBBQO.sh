#!/bin/bash

mostrar_menu_principal(){
	clear
echo "
---------------------------------------------------------
Base de Dades del catàleg de HBBQO
---------------------------------------------------------
1. Llistats de les pel·lícules del catàleg.
2. Cerca d’una pel·lícula al catàleg.
3. Joc de preguntes sobre les pel·lícules.
4. Gestió de la base de dades de pel·lícules.
0. Sortir."
}

enDesenvolupament(){
	clear
	echo "En desenvolupament. Prem enter per continuar."
	read
	mostrar_menu_principal
}

opcioNoValida(){
	clear
	echo "Opció no vàlida."
	sleep 1
	mostrar_menu_principal
}
fitxer_bbdd=$1

mostrar_menu_principal

opcio=1
while [[ "$opcio" =~ ^[0-4] ]]
do
	read opcio
	case $opcio in
		0)
			clear
			echo "Moltes gràcies per visitar HBBQO. Fins la propera."
			exit
			;;
		1)
			enDesenvolupament
			;;
		2)
			enDesenvolupament
			;;
		3)
			enDesenvolupament
			;;
		4)
			enDesenvolupament
			;;

		*)
			opcioNoValida
			let opcio=1
			;;
	esac
done

	
