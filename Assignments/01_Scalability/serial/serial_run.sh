#! /bin/bash
# @author Francesco Cicala
# @version 06/01/2019

TIMEFORMAT='%3R'
M=$1
N=$2

rm times.dat
rm pi.dat

for (( c=0; c<M; c++)) do

 { time ./pi.x $N ; } 2>> times.dat

done
