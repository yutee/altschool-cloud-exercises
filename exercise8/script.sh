#!/usr/bin/bash

MEMORY_FILE="/home/file.txt"
MAIL_ADDRESS="yuteenightxi@gmail.com"

savelogs(){
    time=$(date +"%d-%m-%Y %H:%M:%S")
    memoryUsage=$(free -m | awk 'NR == 2 { printf "%.2f%%", $3*100/2 }')
    echo "$time $memoryUsage" >> "$MEMORY_FILE"
}

sendReports(){
    subject="mail Logs"
    body=$(cat "$MEMORY_FILE")
    echo "$body" | mail -s "$subject" "$MAIL_ADDRESS"
    rm "$MEMORY_FILE"
}

checkTime(){
    currentTime=$(date +"%H")
    if [ "$currentTime" == "00"]; then
    sendReports
    fi
}

while true; do
    saveLogs
    checkTime
    sleep 3600
done