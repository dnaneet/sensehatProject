#!/bin/bash

#''Run python script to collect and store temperature and rel humidity data''#
#/usr/bin/python /home/pi/Desktop/example02.py
/usr/bin/python /home/pi/Desktop/sensehatProject/sense_therm.py  #produces data.csv
#/usr/bin/python /home/pi/Desktop/acceleration.py
#/usr/bin/python /home/pi/Desktop/mag.py >> /home/pi/Desktop/mag.txt
cp /home/pi/Desktop/sensehatProject/data/data.csv /home/pi/Desktop/sensehatProject/data/$(date -d "today" '+%y-%m-%d').data.csv
#tail -6 $(ls -ltrh /home/pi/Desktop/sensehatProject/data/*.csv | tail -1 | awk '{print $9}') > recent.csv


cat $(ls -ltrh /home/pi/Desktop/sensehatProject/data/*-*data.csv | tail -1 | awk '{print $9}') >> /home/pi/Desktop/sensehatProject/data/today.csv

#/usr/bin/git pull --quiet origin master
#/usr/bin/git add --all > /dev/null 2>&1
#/usr/bin/git commit -m "data" > /dev/null 2>&1
#/usr/bin/git push origin master > /dev/null 2>&1


#''Plotting''#
#/home/pi/Desktop/./comfort.sh #Gnuplot to plot the collected data, 2018-Aug-18

#''Upload data to dropbox''#
#/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/rh.txt /sensehat 
#/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/temperature.txt /sensehat
#/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/$(date -d "today" '+%y-%m-%d').data.csv /sensehat


#''Upload plot to dropbox''#
#/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload $(ls -ltrh /home/pi/Desktop/comfort*.pdf  | tail -n 1 | awk '{print $9}') /sensehat

#/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/$(date -d "yesterday 13:00" '+%y-%m-%d').temperature.txt /sensehat/data
#/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/$(date -d "yesterday 13:00" '+%y-%m-%d').rh.txt /sensehat/data


