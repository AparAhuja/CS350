#!/bin/bash
source /helpers.sh

LOG=$LOGS/test_public.log
COMPILE=$LOGS/compile.log
ASSIGNMENTDIR=/assignments/ASST2/

touch $COMPILE
truncate -s 0 $COMPILE

if [ ! -d /kernel ];
then
	unpack_kernel >> $COMPILE 2>> $COMPILE
fi

echo "[CS350] Building Kernel"

build_kernel ASST2 >> $COMPILE 2>> $COMPILE

touch $LOG
truncate -s 0 $LOG

cd /os-compile
echo "[CS350] Testing ASST2"

for c in $ASSIGNMENTDIR/custom_*.conf
do
  for f in $ASSIGNMENTDIR/basic/*
  do
	echo ">SPLIT<" >> $LOG
	cname=$(basename -s .conf $c)
	fname=$(basename $f)
	echo ">TEST=${fname}_${cname}<"  >> $LOG
	echo ">Program Output<" >> $LOG
	P=$(cat $f)
	timeout --foreground 60s sys161 -c $c kernel "$P" >> $LOG 2>> $LOG
	if [ $? -eq 124 ]; 
	then
	    echo "$P has timed out after 60s, this should not occur. Most likely a deadlock" >> $LOG
	fi
  done
done

exit 0
