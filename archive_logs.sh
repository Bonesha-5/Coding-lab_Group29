#!/bin/bash

mkdir -p hospital_data/archived_logs

echo "Select the log the you want to archive"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"

read -p "Enter your choice(1-3): " choice

case $choice in
1)
logcheck="hospital_data/active_logs/heart_rate_log.log"
directorycheck="hospital_data/archived_logs/heart_data_archive"
log="heart_rate_log"
;;
2)
logcheck="hospital_data/active_logs/temperature_log.log"
directorycheck="hospital_data/archived_logs/temperature_data_archive"
log="temperature_log"
;;
3)
logcheck="hospital_data/active_logs/water_usage_log.log"
directorycheck="hospital_data/archived_logs/water_usage_data_archive"
log="water_usage_log"
;;
*)
echo"Invalid choice choose 1,2 or 3"
;;
esac

if [ -f $logcheck ]; then
echo "$logcheck exists"

else
echo "$logcheck does not exist"

fi

if [ -d $directorycheck ]; then
echo "$directorycheck exists"

else
echo "$directorycheck doesnot exists"
echo " Creating $directorycheck now ..."
mkdir -p $directorycheck

fi



time=$(date +"%Y-%m-%d_%H:%M:%S")
archivedlog="$directorycheck/${log}_$time.log"
echo "Archiving $logcheck ..."
mv $logcheck $archivedlog

touch $logcheck

echo "Successfully archived to $archivedlog"
