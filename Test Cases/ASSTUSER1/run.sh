#!/bin/bash

# These functions exist to stop students from using shells within their own 
# shell to execute a program. We remove execution ability and use sudo to move
# to another user to then run the program
move_away()
{
	chmod 500 /bin/sh	
	chmod 500 /bin/bash
}

move_back()
{
	chmod 555 /bin/sh
	chmod 555 /bin/bash
}

source /helpers.sh

LOG=$LOGS/test_public.log
ASSIGNMENTDIR=/assignments/ASSTUSER1/

if [ ! -d /kernel ];
then
	unpack_kernel 
fi

echo "Building assignment (if no other message occurs this means it fails)"
cd /kernel
chmod a+rw .

COMPILE=$LOGS/compile.log
touch $COMPILE
truncate -s 0 $COMPILE 
rm shell > /dev/null 2> /dev/null || true
gcc my_mini_shell.c -o shell >> $COMPILE 2>> $COMPILE 

touch $LOG
truncate -s 0 $LOG

touch output.txt
chown user output.txt
truncate -s 0 output.txt

touch error.txt
truncate -s 0 error.txt
chown user error.txt


# Go through basic tests
# In each of these we are essentially only testing commands with output to stdout

# This is a way to stop students from trying to use the sh command, we search for this command to be used
# afterwords
echo "Testing..."
for f in $ASSIGNMENTDIR/basic/*
do
  echo ">SPLIT<" >> $LOG
  bname=$(basename $f)
  echo ">TEST=$bname<"  >> $LOG
  echo ">Program Output<" >> $LOG
  move_away
  sudo -u user timeout 1s ./shell < $f >> $LOG 2>> $LOG
  move_back

  echo ">Expected Output<" >> $LOG
  bash $f >> $LOG 2>> $LOG
done

# Go through redirect and pipe tests
# In each of these we are testing stuff with redirects
# We always assume that stuff is redirected to a file called output.txt and the stderr is redirected to a file called error.txt
echo "Testing..."
for f in $ASSIGNMENTDIR/redirpipe/*
do
  echo ">SPLIT<" >> $LOG
  bname=$(basename $f)
  echo ">TEST=$bname<"  >> $LOG

  echo ">Program Output<" >> $LOG
  move_away
  sudo -u user timeout 1s ./shell < $f >> $LOG 2>> $LOG
  move_back
  echo ">Output File Contents<" >> $LOG
  cat output.txt >> $LOG
  echo ">Error File Contents<" >> $LOG
  cat error.txt >> $LOG
  truncate -s 0 output.txt
  truncate -s 0 error.txt

  echo ">Expected Output<" >> $LOG
  bash $f >> $LOG 2>> $LOG
  echo ">Output File Contents<" >> $LOG
  cat output.txt >> $LOG
  echo ">Error File Contents<" >> $LOG
  cat error.txt >> $LOG
  truncate -s 0 output.txt
  truncate -s 0 error.txt
done

rm output.txt
rm error.txt

exit 0 
