#!/bin/bash
mkdir five
function file_create(){
    local n=$1
    for line in $(eval echo {1..$n});do
	echo $n>>file$n
    done
}
for i in {1..5};do
    cd five
    mkdir dir$i
    cd dir$i
    for j in {1..4};do
	file_create $j
    done
    cd ..
    cd ..
done

