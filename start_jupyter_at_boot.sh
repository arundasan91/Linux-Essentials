#!/bin/bash
export USERN = username

export PATH=$PATH:/home/$USERN/.local/bin/

su - $USERN -c "bash -c '/home/$USERN/.local/bin/jupyter notebook'"
echo 'Launched Jupyter Notebook'

sed -i "s|PasswordAuthentication no|PasswordAuthentication yes|g" /etc/ssh/sshd_config
export HOSTIP=`hostname -I`
export HOSTN=`hostname`
echo "$HOSTIP $HOSTN" >>/etc/hosts
restart ssh
