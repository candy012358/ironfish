# cập nhật và cài đặt phần phụ
````
sudo apt update && apt upgrade -y
sudo apt install build-essential g++ make
````
# mở screen
````
sudo apt install screen ( chưa có thì cài đặt bằng lệnh này )
sudo screen -S ironfish
````
#  cài đặt nodejs
````
sudo curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
````
# Cài đặt node Ironfish bằng NPM
````
sudo npm install -g ironfish

#check :
ironfish
````
# mở port 9033
````
ufw allow ssh
ufw allow 9033
ufw enable 
````
# đk ac

Sign up a account on https://testnet.ironfish.network/ 

Click on ‘Sign Up’ bottun , Fill the form 

Note: graffiti field mentions name of your node 

copy URL related to your account pase to teminal when ask

# Kết nối node với tài khoản của bạn
````
ironfish testnet
````
# Start Node :
````
ironfish start
````
#Press Ctrl + A + D to detach from screen session

- muốn trở lại phiên screen :
````
screen -ls
screen -x ironfish
````
# check node
- trạng thái
````
ironfish status -f
````
#Press Ctrl + C to exit…
- peer 
````
ironfish peers -f
````
#Press Ctrl + C to exit…

- khởi động
````
ironfish start
````
- log
````
ironfish logs -v
````
# wallet
- check
````
ironfish wallet:accounts
ironfish wallet:address
ironfish wallet:balances
````
- faucet
````
ironfish faucet
````
- task
````
ironfish wallet:mint
ironfish wallet:burn
ironfish wallet:send
````
# tham gia pool
````
ironfish miners:start --pool pool.ironfish.network --address <public-address>
````
# Cách cập nhật nút
````
sudo screen -ls 
screen -x ironfish
#nhấn Ctrl + C để dừng node
#Gỡ bỏ ironfish và cài đặt lại

npm install -g ironfish
ironfish testnet
ironfish start --upgrade
````
