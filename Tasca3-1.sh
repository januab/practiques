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

#echo $peli1 $peli2 $peli3
#echo $titol1 - $titol2 - $titol3

#echo ${#titol1}
#echo $((${#titol1} / 2))
#echo $((${#titol1} - $((${#titol1} / 2))))
#echo ${titol1:0:$((${#titol1} / 2))}
#echo ${titol1:$((${#titol1} / 2)):$((${#titol1} - $((${#titol1} / 2))))}

correcte=$(( $RANDOM % 3 + 1 ))

#echo $correcte

echo "--------------------------------------------------"
echo "3-1 – Completa el títol"
echo "--------------------------------------------------"
case $correcte in
	1)
	echo "(${titol1:0:$((${#titol1} / 2))})"
	;;
	2)
	echo "(${titol2:0:$((${#titol2} / 2))})"
	;;
	3)
	echo "(${titol3:0:$((${#titol3} / 2))})"
	;;
esac

echo "--------------------------------------------------"
echo "Continuacions possibles:"
echo "1 – (${titol1:$((${#titol1} / 2)):$((${#titol1} - $((${#titol1} / 2))))})"
echo "2 – (${titol2:$((${#titol2} / 2)):$((${#titol2} - $((${#titol2} / 2))))})"
echo "3 - (${titol3:$((${#titol3} / 2)):$((${#titol3} - $((${#titol3} / 2))))})"
echo "Selecciona una opció [1,2,3]"

read resposta

if [ $resposta -eq $correcte ];then
	echo "Enhorabona! L'has encertat!"
else
	echo "La resposta no és correcta."
	case $correcte in
	1)
	echo "La resposta correcta és: $titol1"
	;;
	2)
	echo "La resposta correcta és: $titol2"
	;;
	3)
	echo "La resposta correcta és: $titol3"
	;;
esac
	
fi

rm pelis_uniques.txt
