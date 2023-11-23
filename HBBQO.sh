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
mostra_menu_opcio2(){
	clear
	
	echo "------------------------------------------"
	echo "2 - Cerca d’una pel·lícula al catàleg."
	echo "------------------------------------------"
	echo "2-1 Cercar pel·lícules per inici del títol."
	echo "2-2 Cercar pel·lícules per títol i any. "
	echo "2-3 Cercar pel·lícules per “ratinglevel” i títol."
	echo "0 Tornar al menú anterior"

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
				bash Tasca1-1.sh $fitxer_bbdd
				;;
			2)	
				bash Tasca1-2.sh $fitxer_bbdd
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

mostra_rating_levels(){
	clear
	echo "Els Rating Levels existents són:"
	echo ""
	tail +2 $fitxer_bbdd | cut -d, -f2 | sort -t, -k1 | uniq | grep -v '^[[:blank:]]*$'
	echo ""
	echo "Escull-ne un:"
}
opcio2(){
	opcio1=1
	while [[ "$opcio1" =~ ^[0-3] ]]
	do

		mostra_menu_opcio2

		read opcio1
		case $opcio1 in
			0)
				return
				;;
			1)
				clear
				echo "Introdueix una lletra:"
				read lletra1
				echo "Introdueix una altra lletra:"
				read lletra2
				bash Tasca2-1.sh $fitxer_bbdd $lletra1 $lletra1
				;;
			2)	
				clear
				echo "Introdueix una cadena de caràcters:"
				read cadena
				echo "Introdueix un any:"
				read any
				bash Tasca2-2.sh $fitxer_bbdd $cadena $any
				;;
			3)
				mostra_rating_levels
				read rating
				echo "Introdueix una cadena de caràcters:"
				read cadena
				bash Tasca2-3.sh $fitxer_bbdd $rating $cadena
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
			opcio2
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

	
