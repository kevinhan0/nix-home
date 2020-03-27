#!/bin/sh
PATH=/run/current-system/sw/bin
if [ $($PATH/bluetoothctl show | grep "Powered: yes" | $PATH/wc -c) -eq 0 ]
then
  $PATH/bluetoothctl power on
else
  $PATH/bluetoothctl power off
fi
