#!/bin/bash -x
declare -A flippingCoin
flippingCoin[heads]=0
flippingCoin[tails]=0
counter=0
while [ $counter -lt 20 ]
do
	result=$((RANDOM%2))
	if [ $result -eq 0 ]
	then
		flippingCoin[heads]=$(( ${flippingCoin[heads]} + 1 ))
	else
		flippingCoin[tails]=$(( ${flippingCoin[tails]} + 1 ))
	fi
	((counter++))
done
headsPercentage=$((${flippingCoin[heads]} * 100 / 20 )) 
tailsPercentage=$((${flippingCoin[tails]} * 100 / 20 ))
echo  "Head percentage is: "$headsPercentage"%" "Tails percentage is: " $tailsPercentage"%"
