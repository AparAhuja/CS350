#!/bin/bash
source /helpers.sh

LOG=$LOGS/test_public.log
ASSIGNMENTDIR=/assignments/ASSTUSER2/

if [ ! -d /kernel ];
then
	unpack_kernel 
fi

echo "Building assignment (if no other message occurs this means it fails)"
cd /kernel

# We create a temporary directory with the original src code to catch
# those that wanted to change the original files
mkdir .tmp
cp -r $ASSIGNMENTDIR/src/* .tmp/

# Copy in the student changes
cp a2q1/map.c .tmp/a2q1/map.c
cp a2q2/assignment.c .tmp/a2q2/assignment.c


# Create log files
COMPILE=$LOGS/compile.log
touch $COMPILE
truncate -s 0 $COMPILE 

cd .tmp/
# Compile the assignment
cd a2q1
make clean >> $COMPILE 2>> $COMPILE
if ! make >> $COMPILE 2>> $COMPILE; then
	echo "Failed to compile" >> $COMPILE
	exit 1
fi
cd ..

cd a2q2
make clean >> $COMPILE 2>> $COMPILE
if ! make >> $COMPILE 2>> $COMPILE; then
	echo "Failed to compile" >> $COMPILE
	exit 1
fi 
cd ..

touch $LOG
truncate -s 0 $LOG
touch output.txt
truncate -s 0 $LOG
touch temp.txt
truncate -s 0 output.txt
touch error.txt
truncate -s 0 error.txt

# Go through basic tests
# In each of these we are essentially only testing commands with output to stdout
echo "Testing..."
for f in $ASSIGNMENTDIR/basic/*
do
    echo ">SPLIT<" >> $LOG
    cname=$(basename -s .py $f)
    bname=$(basename $f)

    echo ">TEST=$bname<"  >> $LOG
    echo ">Program Output<" >> $LOG
    python3 $f `realpath ./$cname/a.out` >> $LOG 2>> $LOG
done

cd ..
rm -rf .tmp

exit 0 
