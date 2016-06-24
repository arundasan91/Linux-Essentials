#Tutorial: Set up IPMI in a server for Remote Access.

##IPMI: Basics
Abbreviated as IPMI the Intelligent Platform Management Interface was primarily developed by Intel in 1998 for remote management of servers and/or other systems via a network connection. If the server has IPMI configured and is connected to a power supply, the system administrator can send a variety of commands over the network to the server remotely. These commands can, for example, query the power state, power down or power up a server without physically operating it.
IPMI v2.0 allows Console Redirection with enhanced encryption and access control which provides system admins with the entire 'display' of boot process redirected to them via network. This is different than SSH in the sense that system admin can directly interact with the server during booting and even change bios settings like they are physically connected to the server. IMPI is closely tied with the Baseboard Management Card (BMC) system which are operational whenever the server is connected to a power source. Thus the remote capabilities.

##Installation/Configuration: Ubuntu 14.04

In most of the servers, there is a seperate IP adress allocated for IPMI. Seperate mac addresses will be there for ethernet and IPMI. Please make sure you have IPMI capability in your server. The best way to do it is by searching the manuals.
The commands shown here assume sudo capabilities for the user.






#IN PROGRESS. WILL BE COMPLETED SOON.

```



apt-get install ipmitool


ipmitool lan set 8 ipsrc static

ifconfig

ipmitool lan set 8 ipaddr <ip-address_LOCAL>
ipmitool lan set 8 netmask <netmask_LOCAL>

arp
ipmitool lan set 8 defgw macaddr <macaddr_of_router>

route -n
ipmitool lan set 8 defgw ipaddr <default_gateway_ip>

ipmitool lan set 8 arp respond on
ipmitool lan set 8 auth ADMIN MD5
ipmitool lan set 8 access on

ipmitool user set password 2


```
