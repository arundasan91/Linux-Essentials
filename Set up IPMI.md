#Tutorial: Set up IPMI in a server for Remote Access.


# In progress




##IPMI: Basics
Abbreviated as IPMI the Intelligent Platform Management Interface was primarily developed by Intel in 1998 for remote management of servers and/or other systems via a network connection. If the server has IPMI configured and is connected to a power supply, the system administrator can send a variety of commands over the network to the server remotely. These commands can, for example, query the power state, power down or power up a server without physically operating it.
IPMI v2.0 allows Console Redirection with enhanced encryption and access control which provides system admins with the entire 'display' of boot process redirected to them via network. This is different than SSH in the sense that system admin can directly interact with the server during booting and even change bios settings like they are physically connected to the server. IMPI is closely tied with the Baseboard Management Card (BMC) system which are operational whenever the server is connected to a power source. Thus the remote capabilities.

##Installation/Configuration: Ubuntu 14.04

In most of the servers, there is a seperate IP adress allocated for IPMI. Seperate mac addresses will be there for ethernet and IPMI. Please make sure you have IPMI capability in your server. The best way to do it is by searching the manuals.
The commands shown here assume sudo capabilities for the user.

Fisrt we will install ipmitool. IPMItool provides a simple command-line interface to IPMI-enabled devices through an IPMIv1.5 or IPMIv2.0 LAN interface or Linux/Solaris kernel driver. [Sourceforge.net](https://sourceforge.net/projects/ipmitool/).

Install IPMI in all remote machines.
```
apt-get install ipmitool
```
Now, we will load the required kernals and configure IPMI on the remote machines.
For the kernals, run the following:
```
modprobe ipmi_msghandler
modprobe ipmi_devintf
modprobe ipmi_si
```
Basic configuration of the remote machines include setting a static IP (you can leave this step if you prefer DHCP), setting the proper subnets, gateway IPs and mac addresses for proper lan. For me, in an Open Compute server, the lan number was 8. In my understanding, IPMI uses a different lan altogether, with a different IP, mac address etc. You can run the following command to find the lan's available in your remote machine.

```
ipmitool lan print <any number from 1 to 9>
```
In my case lan's available were lan 1 and 8. Lan 1 was connected to my local network. Lan 8 was what I configured for IPMI.

As I mentioned earlier, you can set your IPMI IP address to be static or dynamic. I prefer a static IP. You can change it in the BIOS settings easily. Another way to do it is to manually change it using ipmitool. To set the IP as static, run:
```
ipmitool lan set 8 ipsrc static
```
You might want to update the IP address with another one which is in the range of your current local IP. To find information about your network connections, you can run:
```
ifconfig
```
From the output, find the IP address of your network adapter. Ping IP addresses in close range to the IP address and choose one which is not in use. Arbitrary IP addresses can cause trouble as the server/network maybe allocated with only a bunch of IP addresses. I had this trouble when setting up IPMI since the IP addresses in my lab's datacenter had a different IP address range than the local network. So just do `ifconfig` and choose an unused IP address near to it.

Set the same netmask as the one in the local network.
To set an IP & netmask, run:
```
ipmitool lan set 8 ipaddr <ip-address_LOCAL>
ipmitool lan set 8 netmask <netmask_LOCAL>
```
Some versions of Linux, in our case Ubuntu 14.04, require us to set the Gateway IP also. To get the gateway IP, run:
```
route -n
```
Make note of the Gateway IP and update it using:
```
ipmitool lan set 8 defgw ipaddr <default_gateway_ip>
```
Now we need to update the default gateway mac address. Since we know the gateway IP now, go ahead and run:
```
arp
```
Make note of the mac address corresponding to the default gateway IP. Update it by:
```
ipmitool lan set 8 defgw macaddr <macaddr_of_router>
```
Now that we have set the necessary, we can set a BMC user and a password. To find the list of existing users, run:
```
ipmitool user list 8
```
```

ipmitool user set password 2
```
```
ipmitool lan set 8 arp respond on
ipmitool lan set 8 auth ADMIN MD5
ipmitool lan set 8 access on




```
