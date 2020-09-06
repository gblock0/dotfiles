#!/bin/bash
# modified from http://ficate.com/blog/2012/10/15/battery-life-in-the-land-of-tmux/

charging_default="⚡️ "

if [[ `uname` == 'Linux' ]]; then
  current_charge=$(cat /proc/acpi/battery/BAT1/state | grep 'remaining capacity' | awk '{print $3}')
  total_charge=$(cat /proc/acpi/battery/BAT1/info | grep 'last full capacity' | awk '{print $4}')
else
  battery_info=`ioreg -rc AppleSmartBattery`
  current_charge=$(echo $battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
  total_charge=$(echo $battery_info | grep -o '"MaxCapacity" = [0-9]\+' | awk '{print $3}')
	fully_charged=$(echo $battery_info | grep -o '"FullyCharged" = [A-Za-z]\+' | awk '{print $3}')
	charging=$(echo $battery_info | grep -o '"IsCharging" = [A-Za-z]\+' | awk '{print $3}')
fi

if [ $fully_charged != 'Yes' ]; then
	battery_icon=''
	if [ $charging = 'Yes' ]; then
		echo -n '#[fg=colour241]'
		battery_icon=$charging_default
	else
		echo -n '#[fg=colour9]'
	fi
	percent_charged=$(echo "(($current_charge/$total_charge)*100)+2" | bc -l | cut -d '.' -f 1)
	echo $percent_charged'%'$battery_icon
fi

