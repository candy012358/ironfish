#!/bin/bash

read -p "Enter wallet name: " IRONFISH_WALLET
read -p "Enter node name: " IRONFISH_NODENAME

# Set folder to save json key for later
mkdir -p $HOME/ironfish_jsonkey

for ((i = 11; i <= 20; i++ )); do
	

# Create path of node
mkdir -p $HOME/.ironfish$i

# Set specific port
PORT=`expr $i + 7900`;

# Create systemd for node
echo "[Unit]
Description=IronFish Node $i
After=network-online.target
[Service]
User=$USER
ExecStart=$(which ironfish) start --datadir=$HOME/.ironfish$i --config=config.json --port=$PORT --rpc.tcp.port=$PORT
Restart=on-failure
RestartSec=10
LimitNOFILE=10000
[Install]
WantedBy=multi-user.target
" > $HOME/ironfishd$i.service

#sudo mv $HOME/ironfishd$i.service /etc/systemd/system
#sudo systemctl daemon-reload
#sudo systemctl enable ironfishd$i
#sudo systemctl restart ironfishd$i


# Create systemd for miner (Disabled now)
: ' echo "[Unit]
Description=IronFish Miner
After=network-online.target
[Service]
User=$USER
ExecStart=$(which ironfish) miners:start -v -t $IRONFISH_THREADS --no-richOutput
Restart=on-failure
RestartSec=10
LimitNOFILE=10000
[Install]
WantedBy=multi-user.target
" > $HOME/ironfishd-miner.service 

sudo mv $HOME/ironfishd-miner.service /etc/systemd/system
'

# Create config file
echo "{
        \"nodeName\": \"${IRONFISH_NODENAME}_${i}\",
        \"blockGraffiti\": \"${IRONFISH_NODENAME}_${i}\",
        \"enableTelemetry\": true
}" > $HOME/.ironfish$i/config.json


# Create wallet
ironfish wallet:create ${IRONFISH_WALLET}_${i} --datadir=$HOME/.ironfish$i
ironfish wallet:use ${IRONFISH_WALLET}_${i} --datadir=$HOME/.ironfish$i

# Download snapshot
ironfish chain:download --confirm --datadir=$HOME/.ironfish$i

sleep 10;

# Start node
sudo mv $HOME/ironfishd$i.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable ironfishd$i
sudo systemctl restart ironfishd$i

# Backup wallet
ironfish wallet:export ${IRONFISH_WALLET}_${i} $HOME/ironfish_jsonkey/${IRONFISH_WALLET}_${i}.json --datadir=$HOME/.ironfish$i


# ========================== THE END =================================
done
