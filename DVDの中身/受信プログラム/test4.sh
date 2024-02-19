#!/bin/bash
BTADR="60:8A:10:62:7E:D6"
# example ... address of target device
#sudo apt update
#sudo apt install bluetooth
#sudo apt install bluez
#sudo apt install screen

sudo hciconfig
sudo hciconfig hci0 down
sudo service bluetooth restart
sleep 10
sudo hciconfig hci0 up

sudo hcitool scan
sudo l2ping -c 4 $BTADR
sudo hcitool info $BTADR

bluetoothctl list
#bluetoothctl show
#bluetoothctl --timeout 10 scan on
bluetoothctl info $BTADR

sudo sdptool browse
sudo sdptool records $BTADR
sudo sdptool search SP

N=1 # rfcomm port number
sudo rfcomm bind $N $BTADR
sudo rfcomm -a
sudo stty -F /dev/rfcomm$N 9600 cs8
sudo cat /dev/rfcomm$N
sudo screen /dev/rfcomm$N 9600
 C-a k
sudo rfcomm release $N
