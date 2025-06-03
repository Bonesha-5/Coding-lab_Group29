#!/bin/bash

echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

timestamp=$(date +%F_%H-%M-%S)

case $choice in
  1)
    LOG_FILE="hospital_data/active_logs/heart_rate_teddy.log"
    ARCHIVE_DIR="hospital_data/archived_logs/heart_rate_teddy"
    LOG_NAME="heart_rate_teddy"
    ;;
  2)
    LOG_FILE="hospital_data/active_logs/temperature_teddy.log"
    ARCHIVE_DIR="hospital_data/archived_logs/temperature_teddy"
    LOG_NAME="temperature_teddy"
    ;;
  3)
    LOG_FILE="hospital_data/active_logs/water_usage_teddy.log"
    ARCHIVE_DIR="hospital_data/archived_logs/water_usage_teddy"
    LOG_NAME="water_usage_teddy"
    ;;
  *)
    echo "Invalid choice"
    exit 1
    ;;
esac

if [ ! -f "$LOG_FILE" ]; then
  echo "Log file $LOG_FILE does not exist."
  exit 1
fi

mkdir -p "$ARCHIVE_DIR"

ARCHIVE_FILE="${ARCHIVE_DIR}/${LOG_NAME}_${timestamp}.log"

mv "$LOG_FILE" "$ARCHIVE_FILE"
if [ $? -ne 0 ]; then
  echo "Failed to archive log."
  exit 1
fi

touch "$LOG_FILE"

echo "Archiving $LOG_NAME.log..."
echo "Successfully archived to $ARCHIVE_FILE"
