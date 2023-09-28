#!/bin/bash
PERSIST_DIR=/tmp/open
mkdir -p $PERSIST_DIR
# владелицам $PERSIST_DIR должен быть пользователь, от которого запущен OpenVPN
chown nobody:nobody $PERSIST_DIR
function handle_connect {
CLIENTFILE=$PERSIST_DIR/$common_name
if [ -e "$CLIENTFILE" ]; then
NUMCONN=$(cat $CLIENTFILE)
NEWCONN=$(expr $NUMCONN + 1)
# разрешить не более одного одновременного подключения с одним сертификатом
if [ $NEWCONN -gt 1 ]; then exit 1; fi
echo $NEWCONN >$CLIENTFILE
else
echo 1 >$CLIENTFILE
fi
}
function handle_disconnect {
CLIENTFILE=$PERSIST_DIR/$common_name
if [ -e "$CLIENTFILE" ]; then
NUMCONN=$(cat $CLIENTFILE)
NEWCONN=$(expr $NUMCONN - 1)
echo $NEWCONN >$CLIENTFILE
fi
}
case "$script_type" in
up)
rm -f $PERSIST_DIR/$common_name
;;
client-connect)
"handle_connect"
;;
client-disconnect)
"handle_disconnect"
;;
esac
