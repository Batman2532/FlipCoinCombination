#!/bin/bash -x
declare -A flippingCoin
flippingCoin[heads]=0
flippingCoin[tails]=0
flippingCoin[HH]=0
flippingCoin[HT]=0 
flippingCoin[TH]=0
flippingCoin[TT]=0
counter=0
while [ $counter -lt 20 ]
do
	result1=$((RANDOM%2))
	result2=$((RANDOM%2))
	if [ $result1 -eq 0 ]
	then
		flippingCoin[heads]=$(( ${flippingCoin[heads]} + 1 ))
	else
		flippingCoin[tails]=$(( ${flippingCoin[tails]} + 1 ))
	fi
	
	if [ $result1 -eq 0 -a $result2 -eq 0 ]
	then
		flippingCoin[HH]=$(( ${flippingCoin[HH]} + 1 ))
	elif [ $result1 -eq 0 -a $result2 -eq 1 ]
   then
      flippingCoin[HT]=$(( ${flippingCoin[HT]} + 1 ))
	elif [ $result1 -eq 1 -a $result2 -eq 0 ]
   then
      flippingCoin[TH]=$(( ${flippingCoin[TH]} + 1 ))
	else
      flippingCoin[TT]=$(( ${flippingCoin[TT]} + 1 ))
	fi
	((counter++))

done
headsPercentage=$((${flippingCoin[heads]} * 100 / 20 )) 
tailsPercentage=$((${flippingCoin[tails]} * 100 / 20 ))
HHPercentage=$((${flippingCoin[HH]} * 100 / 20 ))
HTPercentage=$((${flippingCoin[HT]} * 100 / 20 ))
THPercentage=$((${flippingCoin[TH]} * 100 / 20 ))
TTPercentage=$((${flippingCoin[TT]} * 100 / 20 ))
echo "Singlet Combination" "Head percentage is: "$headsPercentage"%" "Tails percentage is: " $tailsPercentage"%"

echo "HH:"$HHPercentage"%" "HT:"$HTPercentage"%" "TH:"$THPercentage"%" "TT:"$TTPercentage"%"
