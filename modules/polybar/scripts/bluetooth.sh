#!/bin/sh
PATH=/run/current-system/sw/bin
if [ $($PATH/bluetoothctl show | grep "Powered: yes" | $PATH/wc -c) -eq 0 ]
then
  echo "%{F#66ffffff}"
else
  if [ $(echo info | $PATH/bluetoothctl | grep 'Device' | $PATH/wc -c) -eq 0 ]
  then 
    echo ""
  fi
  echo "%{F#2193ff}"
fi

