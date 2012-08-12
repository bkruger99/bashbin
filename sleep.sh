#!/bin/bash
# via screen saver
#IDLE=`osascript -e 'tell application "System Events"'  -e 'get running of screen saver preferences'  -e 'end tell'`
# system idletime http://hints.macworld.com/article.php?story=20050126064329159
IDLE=`/usr/sbin/ioreg -c IOHIDSystem | perl -ane 'if (/Idle/) {$idle=(pop @F)/1000000000; print $idle;last}' | sed -e s/\\\..*//g`
if [ $IDLE -gt 1800 ];then
    echo "nap time..."
    date
    #osascript -e 'tell application "Finder" to sleep'
fi
# crontab
#0,10,20,30,40,50 23,0,1,2,8 * * *