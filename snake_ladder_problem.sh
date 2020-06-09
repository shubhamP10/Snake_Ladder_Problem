#! /bin/bash

echo "Welcome to Snake-Ladder Simulation";
POS=0;

play()
{
	local DICE=$(((RANDOM%6)+1));
	echo $DICE;
}
play