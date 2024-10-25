#!/bin/bash

# This script checks the available RAM and storage space on your system.

# Fetch total and available RAM in GiB
total_ram=$(free -h --si | awk '/^Mem:/{print $2}')
used_ram=$(free -h --si | awk '/^Mem:/{print $3}')
available_ram=$(free -h --si | awk '/^Mem:/{print $7}')
used_ram_percent=$(free | awk '/^Mem:/{printf "%.2f", $3/$2 * 100}')

# Fetch total and available storage space in GiB
total_storage=$(df -h / | awk 'NR==2{print $2}')
used_storage=$(df -h / | awk 'NR==2{print $3}')
available_storage=$(df -h / | awk 'NR==2{print $4}')
used_storage_percent=$(df | awk 'NR==2{printf "%.2f", $3/$2 * 100}')

# Display the storage and RAM information
echo "==================================="
echo "         Storage and RAM          "
echo "==================================="
echo "Total RAM: $total_ram (in GiB)"
echo "Used RAM: $used_ram (in GiB) ($used_ram_percent% used) 🛌💤"
echo "Available RAM: $available_ram (in GiB) (Approximately $((100 - ${used_ram_percent%.*}))% available) 🚪💨"
echo "Total Storage: $total_storage (in GiB)"
echo "Used Storage: $used_storage (in GiB) ($used_storage_percent% used) 📦📉"
echo "Available Storage: $available_storage (in GiB) (Approximately $((100 - ${used_storage_percent%.*}))% available) 🗄️📈"
echo "==================================="

# Notes about the values shown
echo -e "\nNote: The RAM values are displayed in GiB (Gibibytes), which is a binary measure (1 GiB = 1024^3 bytes)."
echo "The 'Used' and 'Available' memory values can vary slightly based on system operations and caching."

# Puns to lighten the mood
echo "Hope you're not 'RAM'-bling too much! 🐏"

