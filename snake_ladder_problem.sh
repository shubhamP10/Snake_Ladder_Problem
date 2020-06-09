#! /bin/bash

echo "Welcome to Snake-Ladder Simulation";
echo "Playing With 2 Players";
PLAYER=1;  #player 1 plays first
PLAYER1_POS=0;
PLAYER2_POS=0;
P1_DICE_COUNT=0;
P2_DICE_COUNT=0;
declare -A P1_POS_HISTORY;
declare -A P2_POS_HISTORY;
play()
{
	local DICE=0;
	local OPTION=0;
	if [[ $1 -eq 1 ]]; 
	then
		if [[ $PLAYER1_POS -eq 100 ]]; 
		then
			echo "";
			echo "------------------------";
			echo "Player 1 Won the Game!!!";
			echo "------------------------";
			return;
		fi
		echo "-------------------";
		echo "Player 1 is Playing";
		DICE=$(((RANDOM%6)+1));
		echo "Dice : "$DICE;
		OPTION=$(((RANDOM%3)+1));
		case $OPTION in
			1 )
				echo "Option : No Play";
				echo "Current Position P1: "$PLAYER1_POS;
				P1_DICE_COUNT=$((P1_DICE_COUNT+1));
				echo "Player 1 Dice Count :"$P1_DICE_COUNT;
				P1_POS_HISTORY[P1Dice_$P1_DICE_COUNT]=$PLAYER1_POS;
				PLAYER=2;
				play $PLAYER;
				;;
			2 )
				echo "Option : Ladder";
				if [[ $((PLAYER1_POS+DICE)) -gt 100 ]]; 
				then
					PLAYER1_POS=$PLAYER1_POS;
				else
					PLAYER1_POS=$((PLAYER1_POS+DICE));
				fi
				
				echo "Current Position P1: "$PLAYER1_POS;
				P1_DICE_COUNT=$((P1_DICE_COUNT+1));
				echo "Player 1 Dice Count :"$P1_DICE_COUNT;
				P1_POS_HISTORY[P1Dice_$P1_DICE_COUNT]=$PLAYER1_POS;
				PLAYER=1;
				play $PLAYER;
				;;
			3 )
				echo "Option : Snake";
				if [[ $PLAYER1_POS -eq 0 ]]; 
				then
					PLAYER1_POS=$PLAYER1_POS;
				else
					if [[ $PLAYER1_POS -lt 0 ]]; 
					then
						PLAYER1_POS=0;
					else
						PLAYER1_POS=$((PLAYER1_POS-DICE));
					fi
				fi
				echo "Current Position P1: "$PLAYER1_POS;
				P1_DICE_COUNT=$((P1_DICE_COUNT+1));
				echo "Player 1 Dice Count :"$P1_DICE_COUNT;
				P1_POS_HISTORY[P1Dice_$P1_DICE_COUNT]=$PLAYER1_POS;
				PLAYER=2;
				play $PLAYER;
				;;
		esac
		return;
	fi

	if [[ $1 -eq 2 ]]; 
	then
		if [[ $PLAYER2_POS -eq 100 ]]; 
		then
			echo "";
			echo "------------------------";
			echo "Player 2 Won the Game!!!"
			echo "------------------------";
			return;
		fi
		echo "-------------------";
		echo "Player 2 is Playing";
		DICE=$(((RANDOM%6)+1));
		echo "Dice : "$DICE;
		OPTION=$(((RANDOM%3)+1));
		case $OPTION in
			1 )
				echo "Option : No Play";
				echo "Current Position P2: "$PLAYER2_POS;
				P2_DICE_COUNT=$((P2_DICE_COUNT+1));
				echo "Player 2 Dice Count :"$P2_DICE_COUNT;
				P2_POS_HISTORY[P2Dice_$P2_DICE_COUNT]=$PLAYER2_POS;
				PLAYER=1;
				play $PLAYER;
				;;
			2 )
				echo "Option : Ladder";
				if [[ $((PLAYER2_POS+DICE)) -gt 100 ]]; 
				then
					PLAYER2_POS=$PLAYER2_POS;
				else
					PLAYER2_POS=$((PLAYER2_POS+DICE));
				fi
				
				echo "Current Position P2: "$PLAYER2_POS;
				P2_DICE_COUNT=$((P2_DICE_COUNT+1));
				echo "Player 2 Dice Count :"$P2_DICE_COUNT;
				P2_POS_HISTORY[P2Dice_$P2_DICE_COUNT]=$PLAYER2_POS;
				PLAYER=2;
				play $PLAYER;
				;;
			3 )
				echo "Option : Snake";
				if [[ $PLAYER2_POS -eq 0 ]]; 
				then
					PLAYER2_POS=$PLAYER2_POS;
				else
					if [[ $PLAYER2_POS -lt 0 ]]; 
					then
						PLAYER2_POS=0;
					else
						PLAYER2_POS=$((PLAYER2_POS-DICE));
					fi
				fi
				echo "Current Position P2: "$PLAYER2_POS;
				P2_DICE_COUNT=$((P2_DICE_COUNT+1));
				echo "Player 2 Dice Count :"$P2_DICE_COUNT;
				P2_POS_HISTORY[P2Dice_$P2_DICE_COUNT]=$PLAYER2_POS;
				PLAYER=1;
				play $PLAYER;
				;;
		esac
		

		# P2_POS_HISTORY[P2Dice_$P2_DICE_COUNT]=$PLAYER2_POS;
		return;
	fi
	
}


play PLAYER;

echo "";
echo "!!!GAME COMPLETED!!!";
echo "";
echo "Total Dice Played for Player 1 : "$P1_DICE_COUNT;
echo "Total Dice Played for Player 2 : "$P2_DICE_COUNT;
echo "";
echo "Would you like to View History?";
echo "";
echo "";

while [[ 1 ]];
do
	read -p "-- Press 1 for P1 History, Press 2 for P2 History Press 0 to exit -- " CHOICE
	if [[ $CHOICE -eq 0 ]]; 
	then
		break;
	elif [[ $CHOICE -eq 1 ]]; 
	then
		for i in "${!P1_POS_HISTORY[@]}"
		do
		  echo "$i :: ${P1_POS_HISTORY[$i]}";
		done
	elif [[ $CHOICE -eq 2 ]]; 
	then
		for i in "${!P2_POS_HISTORY[@]}"
		do
		  echo "$i :: ${P2_POS_HISTORY[$i]}";
		done
	fi
done
