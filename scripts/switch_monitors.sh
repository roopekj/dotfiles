#!/bin/sh
source $HOME/dotfiles/environments/current.sh
MONITORS=($MONITORS)
RESOLUTIONS=($RESOLUTIONS)

current_index=0
for MONITOR in ${MONITORS[@]}
do
	# Set resolution
	xrandr --output "$MONITOR" --mode "${RESOLUTIONS[$current_index]}"

	# Set placement
	if (( $current_index > 0 )); then
		xrandr --output "$MONITOR" --right-of "${MONITORS[(( $current_index - 1 ))]}"
	fi

	# Set primary
	if [ "$MONITOR" = "$PRIMARY_MONITOR" ]; then
		xrandr --output "$MONITOR" --primary
	fi

	(( current_index++ ))
done
