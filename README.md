# vpn-scripts
## how to
### Go to CA server and install git
```
apt update && apt install git -y
git clone https://github.com/dumasti/vpn-scripts.git
cp -r vpn-scripts/create-vpn ~/vpn...
cd vpn.../
```
### Change vars in buildCA.sh
change the name of the company in the file buildCA.sh, you can also change the validity period of the certificates.
```
chmod +x *.sh
./buildCA.sh
./vpn-server-add.sh <name>
```

### Go to server openvpn and configure firewall and move config from /tmp/srv/ to /etc/openvpn/
During the creation process there will be interactive questions, we answer them depending on what configuration we want to receive.
The entire structure will be sent to the server. You need to go to the server and move the structure to the /etc/openvpn/ directory, then make executable files in /etc/openvpn/vpnNAME_SERVER/bin/, configure shorewall, ufw or iptables and start the server.
```
mv /tmp/srv/* /etc/openvpn/
chmod +x /etc/openvpn/vpnNAME_SERVER/bin
systemctl enable openvpn@vpnNAME_SERVER --now
```

### For create users certs go to CA server and run this command
In the process of creating a certificate, a certificate number will be requested, depending on what you need, you can select local - only a tunnel is created, or global - all traffic goes through the vpn server.
```
./vpn-client-add.sh <username>
```

## Инструкция для создания нового сервера vpn:
### Идем на CA сервер и устанавливаем git
```
apt update && apt install git -y
git clone https://github.com/dumasti/vpn-scripts.git
cp -r vpn-scripts/create-vpn ~/vpn...
cd vpn.../
```

### Меняем переменные в buildCA.sh
меняем имя фирмы в файле buildCA.sh, так же можно поменять сроки действия сертификатов.
```
chmod +x *.sh
./buildCA.sh
./vpn-server-add.sh <name>
```

### Идем на сервер openvpn и настраиваем файервол, так же перемещаем конфигурацию впн сервера из /tmp/srv/ в /etc/openvpn/
В процессе создания будут интерактивные вопросы, отвечаем на них в зависимости от того, какую конфигурацию хотим получить.
На сервер будет отправлена вся структура. Надо зайти на сервер и переместить структуру в директорию /etc/openvpn/ после сделать исполняемыми файлы в /etc/openvpn/vpnNAME_SERVER/bin/, настроить shorewall, ufw или iptables и запустить сервер.
```
mv /tmp/srv/* /etc/openvpn/
chmod +x /etc/openvpn/vpnNAME_SERVER/bin
systemctl enable openvpn@vpnNAME_SERVER --now
```

### Для создания пользовательского сертификата идем на сервер CA и запускаем следующее
В процессе создания сертификата будет запрошен номер сертификата, в зависимости от того что надо можно выбрать local - создается только туннель, или global - весь трафик идет через впн сервер.
```
./vpn-client-add.sh <username>
```
