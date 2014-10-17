#!/bin/bash

# Usage: shell [name]
SHELL_SH_NAME="$1"

# This is a shell script framework for launching console 
#  applications in XTerm

# The path to each launcher's settings is near, piggy-back off
#  of the path this script
SHELL_SH_PATH=`echo $0 | sed 's/[^\/]*$//'`
SUBDIR=shells

# Some defaults assuming the most common story is ssh to hosts
[ -z $SHELL_SH_COMMAND ] && SHELL_SH_COMMAND=ssh
# Arguments specified separately for ease of user maintaining files
[ -z $SHELL_SH_ARGS ] && SHELL_SH_ARGS=""

[ -z $SHELL_SH_TITLE ] && SHELL_SH_TITLE="$SHELL (shell.sh)"

[ -z $SHELL_SH_BG ] && SHELL_SH_BG=BLACK
[ -z $SHELL_SH_FG ] && SHELL_SH_FG=WHITE

[ -z $SHELL_SH_FONT ] && SHELL_SH_FONT=9x15
[ -z $SHELL_SH_GEOM ] && SHELL_SH_GEOM=80x36

# Source the user-provided terminal settings for the host
#source $SHELL_SH_PATH/$SUBDIR/$SHELL_SH_NAME.txt 
# Doesn't work:
#. $SHELL_SH_PATH/$SUBDIR/$SHELL_SH_NAME.txt || \
	#xlogo -bg red & # <-- warns user if failed
cat $SHELL_SH_PATH/$SUBDIR/$SHELL_SH_NAME.txt | \
	sed 's/^\([A-Z]\+\)\=/SHELL_SH_\1=/' \
	> /tmp/shell.txt
# It might be nice if there was a filesystem type or a path within /proc
#  or /sys where you could use a constant path but get files unique to your process. But could use a function to pick a unique filename. Not predicting problemswith this.

[ $? ] || exit 2

source /tmp/shell.txt

# Launch the proposed terminal
xterm -bg $SHELL_SH_BG -fg $SHELL_SH_FG -font $SHELL_SH_FONT -geom $SHELL_SH_GEOM -title "$SHELL_SH_TITLE" -e "$SHELL_SH_COMMAND $SHELL_SH_ARGS" 
