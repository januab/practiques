#!/bin/bash
f_entrada=$1
num_pelis_pagina=7
num_linies=`wc -l < $f_entrada`
tail +2 $f_entrada | sort -t , -k1 > pelis_ordenades_tmp.csv
clear
echo "*************** HBBQO: El Nostre catàleg alfabètic es: ********************"

for(( i=2; i<$num_linies; i++ ))
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
		if [ ${#var} -gt 0 ];then
			if [ $var == "s" ];then
				break
			fi	
		fi
	fi

done 
rm pelis_ordenades_tmp.csv
