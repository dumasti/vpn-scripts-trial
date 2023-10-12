#!/bin/bash

message="`date +'%F %T'`,$(echo -e "${common_name},${untrusted_ip},${untrusted_port},${ifconfig_pool_remote_ip},${bytes_received}0,${bytes_sent}0,${IV_PLAT},${IV_GUI_VER},${IV_HWADDR},connected ")"
month=`date | cut -d ' ' -f 2`

dir=/var/log/logconnection
if [ -d "$dir" ]
    then
    :
    else
    mkdir -p $dir
fi

if [ -f $dir/logs.$month ]
        then
        echo "${message}" >> $dir/logs.$month
        else
        touch $dir/logs.$month
        echo "${message}" >> $dir/logs.$month
fi
exit 0


