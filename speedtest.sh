#!/bin/sh

location=`termux-location -r last` 
echo $location
mosquitto_pub -h broker.hivemq.com -t topic -m "$location"
wifi=`termux-wifi-connectioninfo`
echo $wifi
mosquitto_pub -h broker.hivemq.com -t topic -m "$wifi"
result=`speedtest-cli --json`
echo $result
mosquitto_pub -h broker.hivemq.com -t topic -m "$result"
