#!/bin/bash

# Folder with wallpapers
WALL_DIR="$HOME/Pictures/wallpapers"

# Delay between wallpapers (in seconds)
DELAY=300  # 5 minutes

# Feh options
FEH_OPTS="--bg-fill"

# Loop forever
while true; do
    for img in "$WALL_DIR"/*; do
        feh $FEH_OPTS "$img"
        sleep $DELAY
    done
done

