sudo rfcomm release /dev/rfcomm1
sudo rfcomm bind 1 60:8A:10:62:7E:D6
sudo chmod 666 /dev/rfcomm1 
sudo cu -s 115200 -l /dev/rfcomm1
