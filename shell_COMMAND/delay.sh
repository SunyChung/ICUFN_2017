
#!/bin/bash

echo "sleep 5 seconds"
sleep 5

echo "WIFI delay 100ms for 5 seconds"
sudo tc qdisc add dev ifb0 root netem delay 100ms
sleep 5

echo "sleep 5 seconds"
sleep 5

echo "LTE delay 200ms for 5 seconds" 
sudo tc qdisc add dev ifb1 root netem delay 200ms
sleep 5

sudo tc qdisc del dev ifb0 root
sudo tc qdisc del dev ifb1 root
echo "back to default"
