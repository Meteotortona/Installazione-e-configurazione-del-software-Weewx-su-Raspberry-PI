#!/bin/bash

/etc/init.d/weewx stop
date >> /home/pi/meteo/restart_rasp.log
/sbin/reboot

exit 0
