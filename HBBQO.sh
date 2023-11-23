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
}

opcioNoValida(){
	clear
	echo "Opció no vàlida."
	sleep 1
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
			enDesenvolupament
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

	
