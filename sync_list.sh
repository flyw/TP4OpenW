#!/bin/sh

rm -f /tmp/tmp/custom

wget https://raw.githubusercontent.com/flyw/TP4OpenW/master/lists/custom  -O /tmp/tmp/custom

NEWFILE=/tmp/tmp/custom
OLDFILE=/root/TP4OpenW/lists/custom
if test -f "$NEWFILE"; then
    if cmp -s "$OLDFILE" "$NEWFILE" ; then
        echo "Nothing changed."
    else
        mv "$NEWFILE" "$OLDFILE"
        echo "List synced."
    fi
fi
echo "Restart DNS ..."
/root/TP4OpenW/update_conf.sh
/etc/init.d/unbound restart
