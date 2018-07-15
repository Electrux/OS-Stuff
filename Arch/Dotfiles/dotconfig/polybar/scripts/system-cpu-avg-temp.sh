#!/bin/bash

temps=$(sensors | grep Core | awk '{print substr($3, 2, length($3)-5)}')
cpu_count=$(printf "%s\n" "${temps}" | wc -l)

total_temp=0

shopt -s lastpipe
printf "%s\n" ${temps} | while read -r line; do
	total_temp=$(echo "${total_temp} + ${line}" | bc)
done
shopt -u lastpipe

echo $(echo "${total_temp} / ${cpu_count}" | bc)°C
