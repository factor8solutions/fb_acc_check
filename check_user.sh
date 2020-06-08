#!/usr/bin/env bash

echo "FB account detect running"

NOW=`date +%m%d%Y%H%M`
F_NAME="$1"
L_NAME="$2"
L_NUM="$3"
H_NUM="$4"
if [ -z "$5" ]; then
	OUT_FILE="$F_NAME.$L_NAME.$L_NUM-$H_NUM.$NOW"
else
	OUT_FILE="$5"
fi

echo "################################################################################"
printf "Scanning with params: \n F_NAME: $F_NAME \n L_NAME: $L_NAME \n L_NUM:  $L_NUM \n H_NUM:  $H_NUM \n"
printf "\n OUT_FILE: $OUT_FILE \n"
echo "################################################################################"

ACC_COUNTER=0
ACC_COUNTER=$((ACC_COUNTER+1))
curl -is -X GET "https://graph.facebook.com/$1.$2" | grep -cq "Cannot query users by their username"
if [ $? == 0 ]; then
	ACC_COUNTER=$((ACC_COUNTER+1))
	echo "$1.$2" | tee -a $OUT_FILE
	
fi
curl -is -X GET "https://graph.facebook.com/$2.$1" | grep -cq "Cannot query users by their username"
if [ $? == 0 ]; then
	ACC_COUNTER=$((ACC_COUNTER+1))
	echo "$2.$1" | tee -a $OUT_FILE
fi
for (( i=$L_NUM; i<=$H_NUM; i++ ))
do
	curl -is -X GET "https://graph.facebook.com/$1.$2.$i" | grep -cq "Cannot query users by their username"
	if [ $? == 0 ]; then
		ACC_COUNTER=$((ACC_COUNTER+1))
		echo "$1.$2.$i" | tee -a $OUT_FILE
	fi
	curl -is -X GET "https://graph.facebook.com/$2.$1.$i" | grep -cq "Cannot query users by their username"
	if [ $? == 0 ]; then
		ACC_COUNTER=$((ACC_COUNTER+1))
		echo "$2.$1.$i" | tee -a $OUT_FILE
	fi
done

echo "Found $ACC_COUNTER accounts"

echo "FB account detect exiting"

exit 0

