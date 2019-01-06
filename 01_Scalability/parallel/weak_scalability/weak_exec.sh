#! /bin/bash
# @author Francesco Cicala
# @version 06/01/2019

module load openmpi
find . -type f -name weak_exec.sh.\* -exec rm {} \;

echo
echo "WEAK SCALABILITY SCRIPT"
echo

for procs in {1..20}
do
  mpirun -np $procs /home/fcicala/high-performance-computing/01_Scalability/parallel/weak_scalability/mpi_weak.x 10000000
done 

mv weak_scal.dat /home/fcicala/high-performance-computing/01_Scalability/parallel/weak_scalability/weak_scal7.dat

