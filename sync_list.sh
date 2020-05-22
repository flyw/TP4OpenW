#!/bin/sh

rm -f /tmp/tmp/custom

wget https://raw.githubusercontent.com/flyw/TP4OpenW/master/lists/custom  -O /tmp/tmp/list -q

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
