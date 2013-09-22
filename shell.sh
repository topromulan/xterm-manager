#!/bin/bash

HOST="$1"

LOCATION=`echo $0 | sed 's/[^\/]*$//'`
SUBDIR=box
TXT=$HOST.txt

cd $LOCATION/$SUBDIR
# The directory containing .txt files named after the hosts which
#  may override these default settings below.

if [ ! -f $TXT ]
then
	logger -sp local0.error "box $TXT not found"
	exit 1
fi

COMMAND=ssh
ARGS=""

TITLE="$HOST (box)"

BG=BLACK
FG=WHITE

FONT=9x15

source $TXT

xterm -bg $BG -fg $FG -font $FONT -title "$TITLE" -e "$COMMAND $ARGS"
