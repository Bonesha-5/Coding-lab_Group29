#!/bin/bash

echo "Select a log file to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

timestamp=$(date "+%Y-%m-%d_%H-%M-%S")

case "$choice" in
  1)
    filename="heart_rate.log"
    archivedir="hospital_data/heart_data_archive"
    ;;
  2)
    filename="temperature.log"
    archivedir="hospital_data/temperature_data_archive"
    ;;
  3)
    filename="water_usage.log"
    archivedir="hospital_data/water_usage_archive"
    ;;
  *)
    echo "Invalid choice"
    exit 1
    ;;
esac

logpath="hospital_data/active_logs/$filename"
archivename="${filename%.log}_$timestamp.log"
archivepath="$archivedir/$archivename"

if [ ! -f "$logpath" ]; then
  echo "Log file not found: $logpath"
  exit 1
fi

mv "$logpath" "$archivepath"
touch "$logpath"
echo "Archived $filename to $archivepath"
