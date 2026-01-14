#!/usr/bin/env bash
set -euo pipefail

echo "========="
date

echo -e "\n===UPTIME / LOAD === "
uptime

echo -e "\n====CPU ( top Snapshot )==="
top -l 1 | grep "CPU usage" || true

echo -e "\n===Top 10 CPU===="
ps -Ao pid,comm,%cpu | sort -nrk 3 | head -10

echo -e "\n====Top 10 RAM====="
ps -Ao pid,comm,rss | sort -nrk 3 | head -10 | awk '{printf "%-8s %-30s %.2f MB\n", $1, $2, $3/1024}'

echo -e "\n=== DISK USAGE ==="
df -h

echo -e "\n=== MEMORY (vm_stat) ==="
vm_stat | head -20
