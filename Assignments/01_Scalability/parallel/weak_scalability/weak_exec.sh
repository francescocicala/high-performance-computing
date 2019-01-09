#! /bin/bash
# @author Francesco Cicala
# @version 06/01/2019

module load openmpi
find . -type f -name weak_exec.sh.\* -exec rm {} \;

echo
echo "WEAK SCALABILITY SCRIPT"
echo

FOLDER="/home/fcicala/high-performance-computing/01_Scalability/parallel/weak_scalability/"
cd "$FOLDER"

for procs in {1..20}
do
  mpirun -np $procs mpi_weak.x 100000
done 
mv weak_scal.dat weak_scal5.dat

for procs in {1..20}
do
  mpirun -np $procs mpi_weak.x 1000000
done 
mv weak_scal.dat weak_scal6.dat


for procs in {1..20}
do
  mpirun -np $procs mpi_weak.x 10000000
done 
mv weak_scal.dat weak_scal7.dat
