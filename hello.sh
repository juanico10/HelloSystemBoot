#!/bin/bash

TOKEN="YOUR_TOKEN_BOT"
ID="YOUR_TOKEN_CHAT"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
DNS="1.1.1.1"
Servidor=$(hostname)
LOCAL_IP=$(ip route get $DNS | grep src| sed 's/.*src \(.*\)$/\1/g' | awk '{print $1}')
PUBLIC_IP=$(curl -s -X GET http://checkip.amazonaws.com)
cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
FREERAM=$(free -mh | grep Mem | awk '{print $4}')
TOTALRAM=$(free -mh | grep Mem | awk '{print $2}')


# Envío del mensaje
/usr/bin/ping -c2 $DNS > /dev/null 2>&1
if [ $? -ne 0 ]
then
        exit 0
else
        curl -s -X POST $URL \
        -d chat_id=$ID \
        -d parse_mode=HTML \
        -d text="$(printf "$MSG $(date +"%d-%m-%Y %H:%M:%S")<code>\n\t\t- SERVER: $servidor\n\t\t- CPU temp: $((cpu/1000))°\n\t\t- RAM: Free $FREERAM/ Total $TOTALRAM\n\t\t- IP address: $LOCAL_IP\n\t\t- IP public: $PUBLIC_IP</code>")" \
                > /dev/null 2>&1
        exit 0
fi
