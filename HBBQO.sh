#!/bin/bash

mostrar_menu_principal(){
	clear
	echo "---------------------------------------------------------"
	echo "Base de Dades del catàleg de HBBQO"
	echo "---------------------------------------------------------"
	echo "1. Llistats de les pel·lícules del catàleg."
	echo "2. Cerca d’una pel·lícula al catàleg."
	echo "3. Joc de preguntes sobre les pel·lícules."
	echo "4. Gestió de la base de dades de pel·lícules."
	echo "0. Sortir."
}

enDesenvolupament(){
	clear
	echo "En desenvolupament. Prem enter per continuar."
	read -n1
}

opcioNoValida(){
	clear
	echo "Opció no vàlida."
	sleep 1
}
mostra_menu_opcio1(){
	clear
	echo "--------------------------------------------------"
	echo "1 - Llistats de les pel·lícules del catàleg."
	echo "--------------------------------------------------"
	echo "1-1 Mostrar catàleg alfabètic."
	echo "1-2 Mostrar catàleg cronològic."
	echo "1-3 Mostrar catàleg per valoració."
	echo "0 Tornar al menú anterior."
}

opcio1(){

	opcio1=1
	while [[ "$opcio1" =~ ^[0-3] ]]
	do
		mostra_menu_opcio1

		read opcio1
		case $opcio1 in
			0)
				return
				;;
			1)
				#enDesenvolupament
				bash Tasca1-1.sh $fitxer_bbdd
				;;
			2)	
				enDesenvolupament
				;;
			3)
				enDesenvolupament
				;;

			*)
				opcioNoValida
				let opcio1=1
				;;
		esac
	done
}
fitxer_bbdd=$1

opcio=1
while [[ "$opcio" =~ ^[0-4] ]]
do
	mostrar_menu_principal
	read opcio
	case $opcio in
		0)
			clear
			echo "Moltes gràcies per visitar HBBQO. Fins la propera."
			exit
			;;
		1)
			opcio1
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

	
