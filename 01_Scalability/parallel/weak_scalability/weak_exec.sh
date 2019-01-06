#! /bin/bash
# @author Francesco Cicala
# @version 06/01/2019

module load openmpi
find . -type f -name weak_run.sh.\* -exec rm {} \;

echo
echo "WEAK SCALABILITY SCRIPT"
echo

for procs in {1..20}
do
  mpirun -np $procs /home/fcicala/high-performance-computing/01_Scalability/parallel/weak_scalability/mpi_weak.x 1000
done 

# mv /home/fcicala/high-performance-computing/01_Scalability/parallel/weak_scalability/weak_scal.dat

