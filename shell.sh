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
GEOM=80x36

# User provided settings
source $LOCATION/$SUBDIR/$TXT

# Launch the proposed terminal
xterm -bg $BG -fg $FG -font $FONT -geom $GEOM -title "$TITLE" -e "$COMMAND $ARGS"
