#!/bin/bash

HOST="$1"

LOCATION=`echo $0 | sed 's/[^\/]*$//'`
SUBDIR=shells
TXT=$HOST.txt

# The piggy-back directory LOCATION/SUBDIR contains .txt files named after the
# hosts/programs which may override these default settings below.

if [ ! -f $LOCATION/$SUBDIR/$TXT ]
then
	logger -sp local0.error "shell $TXT not found"
	exit 1
fi

COMMAND=ssh
ARGS=""

TITLE="$HOST (shell)"

BG=BLACK
FG=WHITE

FONT=9x15

source $LOCATION/$SUBDIR/$TXT

xterm -bg $BG -fg $FG -font $FONT -title "$TITLE" -e "$COMMAND $ARGS"
