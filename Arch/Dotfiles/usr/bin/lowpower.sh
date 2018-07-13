#!/bin/bash

bat_percent=$(acpi -b | cut -d ',' -f2 | cut -d ' ' -f2 | cut -d '%' -f1)

if [[ $bat_percent -ge 5 && $bat_percent -le 10 ]]; then
	/usr/bin/notify-send -a "Power script" "Batter low, currently at ${bat_percent}%"
elif [[ ${bat_percent} -lt 5 ]]; then
	/bin/systemctl suspend
fi
