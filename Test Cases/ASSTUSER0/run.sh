#!/bin/bash
source /helpers.sh

LOG=$LOGS/test_public.log

if [ ! -d /kernel ];
then
	unpack_kernel 
fi

cd /kernel
COMPILE=$LOGS/compile.log
touch $COMPILE
truncate -s 0 $COMPILE 
gcc sort.c -o sort >> $COMPILE 2>> $COMPILE 
gcc make_numbers.c -o make_numbers >> $COMPILE 2>> $COMPILE 

rm log.txt
rm sorted.txt

echo "Testing..."
# Go through the error testing
TEST_ARGS_FILE=/assignments/ASSTUSER0/public_make_numbers
TOTAL=$(wc -l < $TEST_ARGS_FILE)
touch $LOG
truncate -s 0 $LOG
while read p
do
	echo ">SPLIT<" >> $LOG
	IFS=: read name vals <<< $p
	echo ">TEST=$name<"  >> $LOG
	timeout 10s ./make_numbers $vals >> $LOG 2> /dev/null
	EXIT=$?
	echo "" >> $LOG
	echo "EXIT=$EXIT" >> $LOG
done < $TEST_ARGS_FILE

# Go through randomness tests
echo "Testing..."
echo ">SPLIT<" >> $LOG
echo ">TEST=randomness<" >> $LOG
timeout 10s ./make_numbers 100 -100 100
cat log.txt >> $LOG 2>> $LOG
echo "CHECK" >> $LOG
timeout 10s ./make_numbers 100 -100 100
cat log.txt >> $LOG 2>> $LOG

# Check sorting
rm log.txt 2> /dev/null
echo ">SPLIT<" >> $LOG
echo ">TEST=sort<" >> $LOG
timeout 10s ./make_numbers 1000 -1000 1000

echo "Testing..."
# Check speed very basic (we give a lot of lee way on this)
rm sorted.txt 2> /dev/null
echo "BEFORE=$(($(date +%s%N)/1000))" >> $LOG
echo "TIME=`timeout 10s ./sort`" >> $LOG
echo "AFTER=$(($(date +%s%N)/1000))" >> $LOG
cat sorted.txt >> $LOG 2>> $LOG
exit 0 

