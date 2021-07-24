#!/bin/sh
printf "
███████╗ ██████╗ ██████╗ ████████╗ ██████╗ ██████╗ ██╗███╗   ██╗
╚══███╔╝██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝██╔═══██╗██║████╗  ██║
  ███╔╝ ██║   ██║██████╔╝   ██║   ██║     ██║   ██║██║██╔██╗ ██║
 ███╔╝  ██║   ██║██╔══██╗   ██║   ██║     ██║   ██║██║██║╚██╗██║
███████╗╚██████╔╝██║  ██║   ██║   ╚██████╗╚██████╔╝██║██║ ╚████║
╚══════╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝
                                                                \n"
yum -y group install 'Development Tools'




rm -rf /tmp/zortcoin

mkdir /tmp/zortcoin

cd /tmp/zortcoin

git clone https://github.com/zortcoin/zortcoin.git zortcoin

chmod -R 755 /tmp/zortcoin
		
		
 
cd /tmp/zortcoin/zortcoin/depends
make

SHARED_FOLDER="$(ls -td -- */ | head -n 1 | cut -d'/' -f1)"

cd /tmp/zortcoin/zortcoin

sh autogen.sh

bash -c "cd /tmp/zortcoin/zortcoin && CONFIG_SITE=/tmp/zortcoin/zortcoin/depends/${SHARED_FOLDER}/share/config.site ./configure --disable-tests --with-incompatible-bdb"


make

make install

PASS_WORD="$(env LC_CTYPE=C tr -dc a-zA-Z0-9 < /dev/urandom| head -c 32; echo)"


mkdir /root/.zortcoin


cat <<EOF > "/root/.zortcoin/zortcoin.conf"
rpcuser=zortcoinrpc
rpcpassword=${PASS_WORD}
EOF

sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config


cronjob_editor () {         
# usage: cronjob_editor '<interval>' '<command>' <add|remove>

if [[ -z "$1" ]] ;then printf " no interval specified\n" ;fi
if [[ -z "$2" ]] ;then printf " no command specified\n" ;fi
if [[ -z "$3" ]] ;then printf " no action specified\n" ;fi

if [[ "$3" == add ]] ;then
    # add cronjob, no duplication:
    ( crontab -l | grep -v -F -w "$2" ; echo "$1 $2" ) | crontab -
elif [[ "$3" == remove ]] ;then
    # remove cronjob:
    ( crontab -l | grep -v -F -w "$2" ) | crontab -
fi 
} 



cronjob_editor "@reboot" "sudo /usr/local/bin/zortcoind -deprecatedrpc=generate -listen -rpcallowip=0.0.0.0/0 -rpcbind=0.0.0.0 -bind=0.0.0.0 -connect=dnsseed.zortcoin.org -daemon" "add"


yum -y install iptables-services

iptables -I INPUT -p tcp --dport 8333 -j ACCEPT
iptables -I INPUT -p tcp --dport 8332 -j ACCEPT

iptables -I INPUT -p tcp --dport 18333 -j ACCEPT
iptables -I INPUT -p tcp --dport 18332 -j ACCEPT

iptables -I INPUT -p tcp --dport 38333 -j ACCEPT
iptables -I INPUT -p tcp --dport 38332 -j ACCEPT

iptables -I INPUT -p tcp --dport 18444 -j ACCEPT
iptables -I INPUT -p tcp --dport 18443 -j ACCEPT

service iptables save

printf "\\n"
printf "Please reboot system so the daemon can start."
printf "\\n"
printf "\\n"
printf "Please Save This"
printf "\\n"
printf "\\n"
printf "RPC user: zortcoinrpc"
printf "\\n"
printf "RPC password: ${PASS_WORD}"
printf "\\n"
