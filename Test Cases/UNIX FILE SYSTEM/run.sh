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

rm -rf /kernel/*.o

source /helpers.sh

LOG=$LOGS/test_public.log
ASSIGNMENTDIR=/assignments/FINAL/

if [ ! -d /kernel ];
then
	unpack_kernel 
fi

export LC_ALL=C.UTF-8

echo "Building assignment..."
cd /kernel
chmod a+rw .

COMPILE=$LOGS/compile.log
touch $COMPILE
truncate -s 0 $COMPILE 
rm sfssh > /dev/null 2> /dev/null || true
rm -rf ./tests
rm -rf ./data
rm -rf ./bin
make
#gcc main.c  -o myshell -pthread >> $COMPILE 2>> $COMPILE 

touch $LOG
truncate -s 0 $LOG

if test -f "sfssh"; 
then
    echo "Build succeeded."
else
    echo "Build failed."
    exit
fi

#copy test scripts
cp -R $ASSIGNMENTDIR/tests ./

#copy user binary
mkdir /kernel/tests/bin
cp /kernel/sfssh /kernel/tests/bin/sfssh

cd /kernel/tests

# Go through basic tests
# In each of these we are essentially only testing commands with output to stdout

# This is a way to stop students from trying to use the sh command, we search for this command to be used
# afterwords
echo "Testing..."
for f in $ASSIGNMENTDIR/tests/*
do
    if echo "$f" | grep -q ".disabled" || echo "$f" | grep -q ".output"
    then
	continue
    fi

    #refresh test data
    cp -R $ASSIGNMENTDIR/data /kernel/tests/

    bname=$(basename $f)
    fn="${bname%.*}"
    echo " -> ${fn}..."
    echo ">SPLIT<" >> $LOG
    echo ">TEST=$fn<"  >> $LOG
    echo ">Program Output<" >> $LOG
    sudo -u root timeout 5s /bin/bash $f >> $LOG 2>> $LOG
    echo ">Expected Output<" >> $LOG
    cat "${ASSIGNMENTDIR}/tests/${fn}.output" >> $LOG 
done

rm -rf /kernel/tests
rm -rf /kernel/*.o
rm -rf /kernel/sfssh

exit 0 

