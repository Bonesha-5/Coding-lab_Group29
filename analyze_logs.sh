#!/bin/bash

echo "Select log file to analyze: "
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"

read -p "Enter choice (1-3): " choice

if [[ "1 2 3" =~ "$choice" ]]; then echo "Great choice" ; else echo "Error: Enter a valid input"; fi


#create a reports directory and analysis file
ana_dir="reports"
if [ ! -d hospital_data/$ana_dir ];then 
	mkdir -p hospital_data/$ana_dir 
else 
	echo "Directory $ana_dir exist" 
fi

file_name="analysis_report.txt"
if [ ! -f hospital_data/$ana_dir/$file_name ]; then touch hospital_data/$ana_dir/$file_name ;else echo "The file $file_name exist"; fi

#Check the choice of the user and make the analysis report

case $choice in
	1)
		#Here we'll make analysis report for Heart Rate log
		
		#Checking the occurence of first device
		occurence1=$(awk '/HeartRate_Monitor_A/ {line=NR} END {if (line) print line " -This is the occurrence of HeartRate_Monitor_A device"}' /hospital_data/active_logs/heart_rate_log.log)

		#This the time stamp of the first entry data
		timestamp1=$(awk 'NR==1 {print $1" "$2 " -This is the recorded Date and time for the first entry data in Heart Rate Log"}' hospital_data/active_logs/heart_rate_log.log)
		
		#Checking the occurence of Second device
		occurence2=$(awk '/HeartRate_Monitor_B/ {line2=NR} END {if (line2) print line2 " -This is the occurrence of HeartRate_Monitor_B device"}' hospital_data/active_logs/heart_rate_log.log)
		
		#Checking the time stamp of the most recent data/last data entry
		most_recent1=$(awk '{f1=$1; f2=$2} END {print f1, f2}' /hospital_data/active_logs/heart_rate_log.log)
		
		#Printing the output to the user
		echo "$occurence1"
		echo "$occurence2"
		echo "$timestamp1"
		echo "$most_recent1 -This is the most recent or last data entry of the file"

		#Appending the results into the file
		echo "$occurence1" >> /hospital_data/$ana_dir/$file_name
		echo "$occurence2" >> /hospital_data/$ana_dir/$file_name
		echo "$timestamp1" >> /hospital_data/$ana_dir/$file_name
		echo "$most_recent1 -This is the most recent or last data entry of the file" >> hospital_data/$ana_dir/$file_name
		echo "Successfully added the results to the file $ana_dir/$file_name"
		;;
	2)
		#Making the analysis report for Temperature log file

		#Checking the occurence of first device
		occurence3=$(awk '/Temp_Recorder_A/ {line3=NR} END {if (line3) print line3 " is the occurrence of Temp_Recorder_A device"}' hospital_data/active_logs/temperature_log.log)
		
		#Checking the occurence of second device
		occurence4=$(awk '/Temp_Recorder_B/ {line4=NR} END {if (line4) print line4 " is the occurrence of Temp_Recorder_B device"}' hospital_data/active_logs/temperature_log.log)
		
		#Date and time of the first entry data in the file
		timestamp2=$(awk 'NR==1 {print $1" "$2 " -is the recorded time of the first entry of data"}' hospital_data/active_logs/temperature_log.log)
		#Date and time of the most recent data in the file
		most_recent2=$(awk '{f3=$1 ; f4=$2} END {print f3 ,f4}' hospital_data/active_logs/temperature_log.log)

		#Printing the results to the user
		echo "$occurence3"
		echo "$occurence4"
		echo "$timestamp2"
		echo "$most_recent2 -This is the most recent or last data entry of the file"

		#Appending the results to the file
		echo "$occurence3" >> hospital_data/$ana_dir/$file_name
		echo "$occurence4" >> hospital_data/$ana_dir/$file_name
		echo "$timestamp2" >> hospital_data/$ana_dir/$file_name
		echo "$most_recent2 -This is the most recent or last data entry of the file" >> hospital_data/$ana_dir/$file_name
		echo "Successfully added the reults into the file $ana_dir/$file_name"
		;;
	3) 
		#Making analysis report for water usage log file
		
		#Checking for the occurence of the device
		occurence5=$(awk '/Water_Consumption_Meter/ {line5=NR} END {if (line5) print line5 " is the occurrence of Water_Consumption_Meter device"}' hospital_data/active_logs/water_usage_log.log)
		
		#Date and time of the first entry data
		timestamp3=$(awk 'NR==1 {print $1" "$2 " is the recorded time of the first entry of data"}' hospital_data/active_logs/water_usage_log.log)
		#Date and time of the most recent/ last entry data of the file
		most_recent3=$(awk '{f5=$1 ; f6=$2} END {print f5 ,f6}' hospital_data/active_logs/water_usage_log.log)

		#printing the results to the user
		echo "$occurence5"
		echo "$timestamp3"
		echo "$most_recent3 -This is the most recent or last data entry of the file"

		#Appending the results into the file
		echo "$occurence5" >> hospital_data/$ana_dir/$file_name
		echo "$timestamp3" >> hospital_data/$ana_dir/$file_name
		echo "$most_recent3 -This is the most recent or last data entry of the file" >> hospital_data/$ana_dir/$file_name

		echo "Successfully added the results into the file $ana_dir/$file_name"
		;;
	*)
		#For invalid input
		echo "Error: Try again with the correct instructions"
		;;
esac

