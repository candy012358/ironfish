# download file
````
wget -O muilti_iron.sh https://raw.githubusercontent.com/candy012358/ironfish/main/sp/muilti_iron.sh && chmod +x muilti_iron.sh
#edit muilti_iron.sh file according to your requirements
vi muilti_iron.sh
./muilti_iron.sh
````
# task auto
- create folder
````
mkdir -p /root/iron-task
````
- download file
````
wget -O auto.sh https://raw.githubusercontent.com/candy012358/ironfish/main/sp/auto.sh && chmod +x auto.sh
````
````
sudo apt install bc; /root/iron-task; chmod +x auto.sh
for ((i=1 ; i<=4 ; i++ )); do \
cp auto.sh auto$i.sh; \
sed -i -e "s|\.ironfish2|\.ironfish$i|" auto$i.sh ; done
````
- open crontab
````
