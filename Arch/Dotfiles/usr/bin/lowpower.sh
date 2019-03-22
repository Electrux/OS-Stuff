#!/bin/bash

bat_percent=$(acpi -b | cut -d ',' -f2 | cut -d ' ' -f2 | cut -d '%' -f1)
bat_status=$(acpi -b | cut -d ' ' -f3 | cut -d ',' -f1)

if [[ $bat_status == "Discharging" ]]; then
	if [[ $bat_percent -ge 5 && $bat_percent -le 10 ]]; then
		/usr/bin/notify-send -a "Power script" "Battery low, currently at ${bat_percent}%"
	elif [[ ${bat_percent} -lt 5 ]]; then
		/bin/systemctl suspend
	fi
elif [[ $bat_percent -ge 100 ]]; then
	/usr/bin/notify-send -a "Power script" "Battery is full"
fi
