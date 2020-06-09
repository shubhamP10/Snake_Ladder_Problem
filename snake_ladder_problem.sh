#! /bin/bash

echo "Welcome to Snake-Ladder Simulation";
POS=0;


play()
{
	local DICE=$(((RANDOM%6)+1));
	echo "Dice : "$DICE;
	local OPTION=$(((RANDOM%3)+1));
	case $OPTION in
		1 )
			echo "Option : No Play";
			echo "Current Position "$POS;
			;;
		2 )
			echo "Option : Ladder";
			
			POS=$((POS+DICE));
			echo "Current Position "$POS;
			;;
		3 )
			echo "Option : Snake";
			if [[ $POS -eq 0 ]]; 
			then
				POS=$POS;
			else
				if [[ $POS -lt 0 ]]; 
				then
					POS=0;
				else
					POS=$((POS-DICE));
				fi
			fi
			echo "Current Position "$POS;
			;;
	esac
}
while [[ $POS -lt 100 ]]; 
do
	play;
	i=$((i+1));
done
# play