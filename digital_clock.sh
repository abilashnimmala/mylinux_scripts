#!/bin/bash

# Function to display digital clock
show_clock() {
    while true; do
        clear
        echo "======================="
        echo "      DIGITAL CLOCK    "
        echo "======================="
        echo ""
        # Display current time in HH:MM:SS format
        date +"%H:%M:%S"
        echo ""
        echo "Press [CTRL+C] to stop.."
        # Sleep for 1 second before updating the time
        sleep 1
    done
}

# Call the clock function when the script runs
show_clock
