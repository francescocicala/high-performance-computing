#! /bin/bash
# @author Francesco Cicala
# @version 06/01/2019

module load openmp
FOLDER="/home/fcicala/high-performance-computing/Assignments/05_multicore_multinode/openmp101"

cd "$FOLDER"
rm *.sh.*
./omp_101.x
