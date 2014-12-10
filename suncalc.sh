#!/bin/bash
#
# This scripts downloads today's sunrise or sunset times from weather.yahoo.com
#
# Modified by mrwhale
# Get australian code from: https://www.edg3.uk/snippets/weather-location-codes/australia/
# original script from http://remco.bierings.eu/?p=9
#
# Example parameters:
# thisscript.sh sunset # shows today's sunset
# thisscript.sh sunrise # shows today's sunrise

# Enter your location ID obtained from weather.yahoo.com URL 
LOCATION=ASXX0075

if [ ! $1 ]; then
echo "Parameter(s) missing!!!"
echo ""
echo "Example parameters:"
echo "thisscript.sh sunset # shows today's sunset"
echo "thisscript.sh sunrise # shows today's sunrise"
fi

case $1 in

sunset) 
SUNSET12H=`curl -s http://weather.yahooapis.com/forecastrss?p=${LOCATION}|grep astronomy|awk -F\" '{print $4}'`
SUNSET24H=`date --date="${SUNSET12H}" +%T`
date --date "${SUNSET24H}" +%R 
;;

sunrise)
SUNRISE12H=`curl -s http://weather.yahooapis.com/forecastrss?p=${LOCATION}|grep astronomy|awk -F\" '{print $2}'`
SUNRISE24H=`date --date="${SUNRISE12H}" +%T`
date --date "${SUNRISE24H}" +%R 
;;
esac
