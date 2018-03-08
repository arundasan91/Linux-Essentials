sudo apt-get install python-dev python3-dev
sudo apt-get install mysql-client-core-5.7
sudo apt-get install mysql-server
sudo apt-get install libmysqlclient-dev
pip3 install --user configparser
pip3 install --user mysqlclient

# Alternate Method
wget https://dev.mysql.com/get/Downloads/Connector-Python/mysql-connector-python-cext-py3_2.1.7-1ubuntu16.04_amd64.deb
sudo dpkg -i mysql-connector-python-cext-py3_2.1.7-1ubuntu16.04_amd64.deb
sudo apt-get update
# sudo apt-get install 
