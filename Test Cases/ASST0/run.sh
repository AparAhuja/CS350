#!/bin/bash
source /helpers.sh

if [ ! -d /kernel ];
then
	unpack_kernel 
fi

build_kernel ASST0

test_kernel ASST0
