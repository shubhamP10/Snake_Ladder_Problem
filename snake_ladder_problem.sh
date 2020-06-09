#! /bin/bash

echo "Welcome to Snake-Ladder Simulation";
POS=0;
DICE_COUNT=0;
declare -A POS_HISTORY;
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
			if [[ $((POS+DICE)) -gt 100 ]]; 
			then
				POS=$POS;
			else
				POS=$((POS+DICE));
			fi
			
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
	DICE_COUNT=$((DICE_COUNT+1));
	POS_HISTORY[Dice_$DICE_COUNT]=$POS;
}
while [[ $POS -lt 100 ]]; 
do
	play;
done
echo "";
echo "!!!GAME COMPLETED!!!";
echo "";
echo "Total Dice Played : "$DICE_COUNT;
echo "";
echo "Would you like to View History?";
# echo "";
read -p "-- Press 1 to View History Press 0 to exit -- " CHOICE
echo "";

if [[ $CHOICE -eq 1 ]]; 
then
	for i in "${!POS_HISTORY[@]}"
	do
	  echo "$i :: ${POS_HISTORY[$i]}";
	done
fi

