#!/usr/bin/env bash
set -euo pipefail

CPU_THRESHOLD=80
DISK_THRESHOLD=80

echo "=== Resource Alert Check ==="
date

# CPU check (macOS)
CPU_IDLE=$(top -l 1 | grep "CPU usage" | awk '{print $7}' | tr -d '%')
CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)

echo "CPU Usage: ${CPU_USAGE}%"

if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
  echo "⚠️ ALERT: High CPU usage!"
fi

# Disk check
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

echo "Disk Usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
  echo "⚠️ ALERT: Disk usage is above threshold!"
fi

