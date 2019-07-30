#!/bin/sh

id=`shuf -i 1-100000000 -n 1`
location=`termux-location -r last` 
echo $location
mosquitto_pub -h broker.hivemq.com -t tele/broker/$id/location -m "$location"
wifi=`termux-wifi-connectioninfo`
echo $wifi
mosquitto_pub -h broker.hivemq.com -t tele/broker/$id/wifi -m "$wifi"
result=`speedtest-cli --json`
echo $result
mosquitto_pub -h broker.hivemq.com -t tele/broker/$id/speedtest -m "$result"
