#!/bin/bash

image-5-input() {
    cat <<EOF
mount
stat 1
stat 2
stat 3
EOF
}

image-5-output() {
    cat <<EOF
disk mounted.
inode 1 has size 965 bytes.
stat failed!
stat failed!
EOF
}

image-20-input() {
    cat <<EOF
mount
stat 1
stat 2
stat 3
EOF
}

image-20-output() {
    cat <<EOF
disk mounted.
stat failed!
inode 2 has size 27160 bytes.
inode 3 has size 9546 bytes.
EOF
}

image-200-input() {
    cat <<EOF
mount
stat 1
stat 2
stat 3
stat 9
EOF
}

image-200-output() {
    cat <<EOF
disk mounted.
inode 1 has size 1523 bytes.
inode 2 has size 105421 bytes.
stat failed!
inode 9 has size 409305 bytes.
EOF
}

test-stat() {
    BLOCKS=$1

    #echo -n "Testing stat on data/image.$BLOCKS ... "
    prog_out=$(image-$BLOCKS-input | ./bin/sfssh data/image.$BLOCKS $BLOCKS 2> /dev/null)
    prog_out=$(printf "$prog_out" | grep -v "block reads" | grep -v "block writes")
    if diff -u <(printf "$prog_out\n") <(image-$BLOCKS-output) > test.log; then
    	echo "[RESULT]Success"
    else
    	echo "[RESULT]Failure"
    	cat test.log
    fi
    rm -f test.log
}

test-stat 5
test-stat 20
test-stat 200
