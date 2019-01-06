#! /bin/bash

module load openmpi
find . -type f -name weak_run.sh.\* -exec rm {} \;

echo
echo "WEAK SCALABILITY SCRIPT"
echo

for procs in {1..20}
do
  mpirun -np $procs /home/fcicala/ex1_scalability/weak_exec/mpi_weak.x 100000000
done 

mv /home/fcicala/weak_scal.dat /home/fcicala/ex1_scalability/weak_exec/weak_scal.dat
