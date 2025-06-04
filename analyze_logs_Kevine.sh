#!/bin/bash

echo "Select log file to analyze: "
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"

read -p "Enter choice (1-3): " choice

if [[ "1 2 3" =~ "$choice" ]]; then echo "Great choice" ; else echo "Error: Enter a valid input"; fi

#create a reports directory and analysis file
ana_dir="reports"
if [ ! -d $ana_dir ]; then mkdir $ana_dir ; fi

file_name="analysis_report.txt"
if [ ! -f $ana_dir/$file_name ]; then touch $ana_dir/$file_name ; fi

#Check the choice of the user and make the analysis report

case $choice in
	1)
		occurence1=$(awk '/HeartRate_Monitor_A/ {line=NR} END {if (line) print line " is the occurrence of HeartRate_Monitor_A device"}' active_logs/heart_rate_log.log)
		timestamp1=$(awk 'NR==1 {print $1"\t"$2 " This is the recorded time for the first entry od data"}' active_logs/heart_rate_log.log)
		occurence2=$(awk '/HeartRate_Monitor_B/ {line2=NR} END {if (line2) print line2 " is the occurrence of HeartRate_Monitor_B device"}' active_logs/heart_rate_log.log)
		echo "$occurence1" >> $ana_dir/$file_name
		echo "$occurence2" >> $ana_dir/$file_name
		echo "$timestamp1" >> $ana_dir/$file_name
		echo " Successfully added the results to the file $ana_dir/$file_name"
		;;
	2)
		occurence3=$(awk '/Temp_Recorder_A/ {line3=NR} END {if (line3) print line3 " is the occurrence of Temp_Recorder_A device"}' active_logs/temperature_log.log)
		occurence4=$(awk '/Temp_Recorder_B/ {line4=NR} END {if (line4) print line4 " is the occurrence of Temp_Recorder_B device"}' active_logs/temperature_log.log)
		timestamp2=$(awk 'NR==1 {print $1"\t"$2 " is the recorded time of the first entry of data"}' active_logs/temperature_log.log)
		echo "$occurence3" >> $ana_dir/$file_name
		echo "$occurence4" >> $ana_dir/$file_name
		echo "$timestamp2" >> $ana_dir/$file_name
		echo " Successfully added the reults into the file $ana_dir/$file_name"
		;;
	3) 
		occurence5=$(awk '/Water_Consumption_Meter/ {line5=NR} END {if (line5) print line5 " is the occurrence of Water_Consumption_Meter device"}' active_logs/water_usage_log.log)
		timestamp3=$(awk 'NR==1 {print $1"\t"$2 " is the recorded time of the first entry of data"}' active_logs/water_usage_log.log)
		echo "$occurence5" >> $ana_dir/$file_name
		echo "$timestamp3" >> $ana_dir/$file_name
		echo " Successfully added the reults into the file $ana_dir/$file_name"
		;;
	*)
		echo "Error: Try again with the correct instructions"
		;;
esac

