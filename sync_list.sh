#!/bin/sh

rm -f /tmp/tmp/list

wget https://raw.githubusercontent.com/flyw/TP4OpenW/master/lists/list  -O /tmp/tmp/list -q

NEWFILE=/tmp/tmp/list
OLDFILE=/root/TP4OpenW/lists/list
if test -f "$NEWFILE"; then
    if cmp -s "$OLDFILE" "$NEWFILE" ; then
        echo "Nothing changed."
    else
        mv "$NEWFILE" "$OLDFILE"
        echo "List synced."
    fi
fi
