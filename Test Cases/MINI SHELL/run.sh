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
ASSIGNMENTDIR=/assignments/MIDTERM/

if [ ! -d /kernel ];
then
	unpack_kernel 
fi

echo "Building assignment..."
cd /kernel
chmod a+rw .

COMPILE=$LOGS/compile.log
touch $COMPILE
truncate -s 0 $COMPILE 
rm myshell > /dev/null 2> /dev/null || true
gcc main.c  -o myshell -pthread >> $COMPILE 2>> $COMPILE 

touch $LOG
truncate -s 0 $LOG

if test -f "myshell"; 
then
    echo "Build succeeded."
else
    echo "Build failed."
    exit
fi

time_start=0
time_stop=0

# Go through basic tests
# In each of these we are essentially only testing commands with output to stdout

# This is a way to stop students from trying to use the sh command, we search for this command to be used
# afterwords
echo "Testing basic..."
for f in $ASSIGNMENTDIR/basic/*
do
    if echo "$f" | grep -q ".conf" || echo "$f" | grep -q ".output"
    then
	continue
    fi

    output=0
    if test -f "${f}.output" 
    then
	output=1
    fi

    duration_min=0
    duration=1
    if test -f "${f}.conf" 
    then
	duration_min=$(cat "${f}.conf" | cut -d' ' -f1)
	duration=$(cat "${f}.conf" | cut -d' ' -f2-)
    fi

    bname=$(basename $f)
    echo " -> ${bname}..."

    echo ">SPLIT<" >> $LOG
    echo ">TEST=$bname<"  >> $LOG
    echo ">Program Output<" >> $LOG
    move_away
    time_start=$(date +%s)
    sudo -u user timeout "${duration}s" ./myshell < $f >> $LOG 2>> $LOG
    time_stop=$(date +%s)
    move_back

    echo "" >> $LOG
    echo ">Expected Output<" >> $LOG
    if [ "$output" = 0 ];
    then
	bash $f >> $LOG 2>> $LOG
    else
	cat "${f}.output" >> $LOG
    fi
    echo ">Start Time<" >> $LOG
    echo $time_start >> $LOG
    echo ">Stop Time<" >> $LOG
    echo $time_stop >> $LOG
    echo ">Target Time Min<" >> $LOG
    echo $duration_min >> $LOG
    echo ">Target Time Max<" >> $LOG
    echo $duration >> $LOG
done

# Go through stderr print test
echo "Testing stderr..."
for f in $ASSIGNMENTDIR/stderr/*
do
    if echo "$f" | grep -q ".conf" || echo "$f" | grep -q ".output"
    then
	continue
    fi

    output=0
    if test -f "${f}.output" 
    then
	output=1
    fi

    duration_min=0
    duration=1
    if test -f "${f}.conf" 
    then
	duration_min=$(cat "${f}.conf" | cut -d' ' -f1)
	duration=$(cat "${f}.conf" | cut -d' ' -f2-)
    fi

    bname=$(basename $f)
    echo " -> ${bname}..."

    echo ">SPLIT<" >> $LOG
    echo ">TEST=$bname<"  >> $LOG
    echo ">Program Output<" >> $LOG
    move_away
    time_start=$(date +%s)
    sudo -u user timeout "${duration}s" ./myshell < $f >> /dev/null 2>> $LOG
    time_stop=$(date +%s)
    move_back

    echo "" >> $LOG
    echo ">Expected Output<" >> $LOG
    if [ "$output" = 0 ];
    then
	bash $f >> /dev/null 2>> $LOG
    else
	cat "${f}.output" >> $LOG
    fi
    echo ">Start Time<" >> $LOG
    echo $time_start >> $LOG
    echo ">Stop Time<" >> $LOG
    echo $time_stop >> $LOG
    echo ">Target Time Min<" >> $LOG
    echo $duration_min >> $LOG
    echo ">Target Time Max<" >> $LOG
    echo $duration >> $LOG
done


# Go through batch mode test specifically for this shell
echo "Testing batch..."
for f in $ASSIGNMENTDIR/batch/*
do
    if echo "$f" | grep -q ".conf" || echo "$f" | grep -q ".output"
    then
	continue
    fi

    duration_min=0
    duration=1
    if test -f "${f}.conf" 
    then
	duration_min=$(cat "${f}.conf" | cut -d' ' -f1)
	duration=$(cat "${f}.conf" | cut -d' ' -f2-)
    fi

    # replace the string in first echo by a random key
    sudo -u user cp $f "${f}.test"
    echok="echo K$((1 + $RANDOM % 30000))"
    sed -i "1s/.*/$echok/" "${f}.test"

    bname=$(basename $f)
    echo " -> ${bname}..."

    echo ">SPLIT<" >> $LOG
    echo ">TEST=$bname<" >> $LOG
    echo ">Program Output<" >> $LOG
    move_away
    time_start=$(date +%s)
    sudo -u user timeout "${duration}s" ./myshell "$f.test" >> $LOG 2>> $LOG
    time_stop=$(date +%s)
    move_back
    
    echo ">Expected Output<" >> $LOG
    bash < "$f.test" >> $LOG 2>> $LOG
    
    echo ">Start Time<" >> $LOG
    echo $time_start >> $LOG
    echo ">Stop Time<" >> $LOG
    echo $time_stop >> $LOG
    echo ">Target Time Min<" >> $LOG
    echo $duration_min >> $LOG
    echo ">Target Time Max<" >> $LOG
    echo $duration >> $LOG

    rm "${f}.test"
done


exit 0 

