#!/bin/bash

cat $1 | uniq > pelis_uniques.txt
num_linies=`wc -l <pelis_uniques.txt`

peli1=$(( $RANDOM % $num_linies + 1 ))
peli2=$(( $RANDOM % $num_linies + 1 ))
while [ $peli2 -eq $peli1 ] 
do
	peli2=$(( $RANDOM % $num_linies + 1 ))
done
peli3=$(( $RANDOM % $num_linies + 1 ))
while [ $peli3 -eq $peli2 ] || [ $peli3 -eq $peli1 ] 
do
	peli3=$(( $RANDOM % $num_linies + 1 ))
done

titol1=`head -$peli1 pelis_uniques.txt | tail -1 | cut -d, -f1`
titol2=`head -$peli2 pelis_uniques.txt | tail -1 | cut -d, -f1`
titol3=`head -$peli3 pelis_uniques.txt | tail -1 | cut -d, -f1`

echo $peli1 $peli2 $peli3
echo $titol1 $titol2 $titol3
exit



#rm pelis_uniques.txt
