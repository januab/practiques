#!/bin/bash

num_pelis_pagina=7

f_entrada=$1
nova_cerca="si"

while [ $nova_cerca == "si" ]
do
	clear
	echo "Introdueix una cadena de caràcters:"
	read cadena
	echo "Introdueix un any:"
	read any

	grep ^[^,]*$cadena[^,]*,[^,]*,[^,]*,$any $f_entrada | sort -t , -k1 > pelis_ordenades_tmp.csv

	num_linies=`wc -l < pelis_ordenades_tmp.csv`

	if [ $num_linies -eq 0 ]; then
		echo "";
		echo "Pel·lícula no trobada"
	else
		clear
		for(( i=1; i<=$num_linies; i++ ))
		do
					linia=`head -$i pelis_ordenades_tmp.csv | tail -1`
			titol=`echo $linia | cut -d"," -f1`
			ratinglevel=`echo $linia | cut -d"," -f2`
			ratingdescription=`echo $linia | cut -d"," -f3`
			release_year=`echo $linia | cut -d"," -f4`
			user_rating_score=`echo $linia | cut -d"," -f5`
			user_rating_size=`echo $linia | cut -d"," -f6`

			echo "*****************************************************************************"
			echo "*Títol: $titol"
			echo "*Any: $release_year *Nivell de classificació: $ratinglevel"
			echo "*Descripció: $ratingdescription"
			echo "*Valoració dels usuaris: $user_rating_score *Mida de la mostra: $user_rating_size"

			let resta=$i%$num_pelis_pagina

			if [ $resta -eq 6 ];then
				echo " ";
				echo "Prem enter per continuar o s per sortir:"
				read -n1 var
				clear
				
				if [ ${#var} -eq 1 ]; then
					if [ $var == "s" ];then
						break
					fi
				fi	
			fi
		done 
	fi
	echo "";
	echo "Vols fer una altra cerca? [si/no]:"
	read nova_cerca
done

rm pelis_ordenades_tmp.csv
