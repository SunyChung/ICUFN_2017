
#!/bin/bash

echo "sleep 10 seconds"
sleep 10

sudo tc qdisc add dev wlan0 parent 1:1 handle 10: tbf rate 20mbit burst 20mbit latency 1
echo "sleep 10 seconds"
sleep 10

sudo tc qdisc change dev wlan0 parent 1:1 handle 10: tbf rate 10mbit burst 10mbit latency 1
echo "sleep 10 seconds"
sleep 10

sudo tc qdisc del dev wlan0 parent 1:1 handle 10: 
echo "back to default"

