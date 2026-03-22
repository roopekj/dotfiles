#!/bin/sh

ACTIVE_ENVIRONMENT="$HOME/dotfiles/environments/active.environment"
if [ -f "$ACTIVE_ENVIRONMENT" ]; then
    source "$ACTIVE_ENVIRONMENT"
else
    echo "Environment '$ACTIVE_ENVIRONMENT' does not exist." >&2
    exit 1
fi

ALL_MONITORS=$(xrandr | grep " connected" | cut -d" " -f1)
ENABLED_MONITORS=($ENABLED_MONITORS)
RESOLUTIONS=($RESOLUTIONS)


turn_off_unused() {
	                        for          OUTPUT in $ALL_MONITORS
	do
SKIP=false
		for ACTIVE in "${ENABLED_MONITORS[@]}"
		do
			if [ "$OUTPUT" = "$ACTIVE" ]; then
				SKIP=true
				break
			fi
		done

		if [ "$SKIP" = false ]; then
			xrandr --output "$OUTPUT" --off
		fi
	done
}

if [[ $1 == "normal" ]]; then
    current_index=0
	for MONITOR in ${ENABLED_MONITORS[@]}
    do
        # Set resolution
        xrandr --output "$MONITOR" --mode "${RESOLUTIONS[$current_index]}"

		# Set placement
		if (( $current_index > 0 )); then
			xrandr --output "$MONITOR" --right-of "${ENABLED_MONITORS[(( $current_index - 1 ))]}"
		fi

		# Set primary
		if [ "$MONITOR" = "$PRIMARY_MONITOR" ]; then
			xrandr --output "$MONITOR" --primary
		fi

		(( current_index++ ))
	done

    turn_off_unused
elif [[ $1 == "presentation" ]]; then
    xrandr --output "$PRIMARY_MONITOR" --primary --auto --output "$PRESENTATION_MONITOR" --right-of "$PRIMARY_MONITOR" --auto
    turn_off_unused
fi
