#!/bin/zsh
className=$1
app=$2

if hyprctl clients -j | jq -r '.[] | select(.class == "$className")' > /dev/null; then
   	hyprctl dispatch focuswindow "class:$className"
else
	$app
fi

