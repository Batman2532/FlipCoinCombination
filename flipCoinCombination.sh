#!/bin/bash -x
declare -A flippingCoin
flippingCoin[heads]=0
flippingCoin[tails]=0
flippingCoin[HH]=0
flippingCoin[HT]=0 
flippingCoin[TH]=0
flippingCoin[TT]=0
flippingCoin[HHH]=0
flippingCoin[HHT]=0
flippingCoin[HTH]=0
flippingCoin[THH]=0
flippingCoin[TTT]=0
flippingCoin[TTH]=0
flippingCoin[THT]=0
flippingCoin[HTT]=0
counter=0
while [ $counter -lt 20 ]
do
	result1=$((RANDOM%2))
	result2=$((RANDOM%2))
	result3=$((RANDOM%2))
#Singlet
	if [ $result1 -eq 0 ]
	then
		flippingCoin[heads]=$(( ${flippingCoin[heads]} + 1 ))
	else
		flippingCoin[tails]=$(( ${flippingCoin[tails]} + 1 ))
	fi
	
#Doublet
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

#Triplet
	if [ $result1 -eq 0 -a $result2 -eq 0 -a $result3 -eq 0 ]
   then
      flippingCoin[HHH]=$(( ${flippingCoin[HHH]} + 1 ))
	elif [ $result1 -eq 0 -a $result2 -eq 0 -a $result3 -eq 1 ]
   then
      flippingCoin[HHT]=$(( ${flippingCoin[HHT]} + 1 ))	
	elif [ $result1 -eq 0 -a $result2 -eq 1 -a $result3 -eq 0 ]
   then
      flippingCoin[HTH]=$(( ${flippingCoin[HTH]} + 1 ))
	elif [ $result1 -eq 1 -a $result2 -eq 0 -a $result3 -eq 0 ]
   then
      flippingCoin[THH]=$(( ${flippingCoin[THH]} + 1 ))

	elif [ $result1 -eq 1 -a $result2 -eq 1 -a $result3 -eq 1 ]
   then
      flippingCoin[TTT]=$(( ${flippingCoin[TTT]} + 1 ))
	elif [ $result1 -eq 1 -a $result2 -eq 1 -a $result3 -eq 0 ]
   then
      flippingCoin[TTH]=$(( ${flippingCoin[TTH]} + 1 ))
	elif [ $result1 -eq 1 -a $result2 -eq 0 -a $result3 -eq 1 ]
   then
      flippingCoin[THT]=$(( ${flippingCoin[THT]} + 1 ))
	else 
      flippingCoin[HTT]=$(( ${flippingCoin[HTT]} + 1 ))
	fi

	((counter++))

done
headsPercentage=$((${flippingCoin[heads]} * 100 / 20 )) 
tailsPercentage=$((${flippingCoin[tails]} * 100 / 20 ))

HHPercentage=$((${flippingCoin[HH]} * 100 / 20 ))
HTPercentage=$((${flippingCoin[HT]} * 100 / 20 ))
THPercentage=$((${flippingCoin[TH]} * 100 / 20 ))
TTPercentage=$((${flippingCoin[TT]} * 100 / 20 ))

HHHPercentage=$((${flippingCoin[HHH]} * 100 / 20))
HHTPercentage=$((${flippingCoin[HHT]} * 100 / 20))
HTHPercentage=$((${flippingCoin[HTH]} * 100 / 20))
THHPercentage=$((${flippingCoin[THH]} * 100 / 20))

TTTPercentage=$((${flippingCoin[TTT]} * 100 / 20))
TTHPercentage=$((${flippingCoin[TTH]} * 100 / 20))
THTPercentage=$((${flippingCoin[THT]} * 100 / 20))
HTTPercentage=$((${flippingCoin[HTT]} * 100 / 20))

echo "Singlet Combination" "Head percentage is: "$headsPercentage"%" "Tails percentage is: " $tailsPercentage"%"

echo "HH:"$HHPercentage"%" "HT:"$HTPercentage"%" "TH:"$THPercentage"%" "TT:"$TTPercentage"%"

echo "Triplet: " $HHHPercentage"%" $HHTPercentage"%" $HTHPercentage"%" $THHPercentage"%" $TTTPercentage"%" $TTHPercentage"%" $THTPercentage"%" $HTTPercentage"%"
