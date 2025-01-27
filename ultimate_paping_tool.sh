#!/bin/bash

# Header
clear
echo "====================================================="
echo "                   Ultimate Paping Tool"
echo "====================================================="
echo "This tool constantly checks a TCP port for connectivity"
echo "with faster intervals and real-time color-coded output."
echo "====================================================="
echo

# Get user input for hostname and port
read -p "Enter the hostname or IP address: " host
read -p "Enter the port to ping (TCP): " port

# Confirm inputs
echo "====================================================="
echo "Host: $host"
echo "Port: $port"
echo "Starting TCP ping... Press Ctrl+C to stop."
echo "====================================================="

# Run the high-speed TCP ping loop
while true; do
    if nc -z -w1 $host $port; then
        echo -e "\e[32m[CONNECTED] $host:$port at $(date +%H:%M:%S.%3N)\e[0m"
    else
        echo -e "\e[31m[DOWN]      $host:$port at $(date +%H:%M:%S.%3N)\e[0m"
    fi
    sleep 0.2
done