
#!/bin/bash

echo "sleep 5 seconds"
sleep 5

echo "WIFI loss 0.1% for 5 seconds"
sudo tc qdisc add dev ifb0 root netem loss 0.1%
sleep 5

echo "sleep 5 seconds"
sleep 5

echo "LTE loss 0.5% for 5 seconds" 
sudo tc qdisc add dev ifb1 root netem loss 0.5%
sleep 5

sudo tc qdisc del dev ifb0 root
sudo tc qdisc del dev ifb1 root
echo "back to default"
