#! /bin/bash

module load openmpi
find . -type f -name strong_run.sh.\* -exec rm {} \;

echo
echo "STRONG SCALABILITY SCRIPT"
echo

N=10000000000

for procs in {1..20}
do
  iter_per_proc=$(bc <<< "scale = 4; $N/$procs")
  iter_per_proc=${iter_per_proc%.*} 
  echo
  echo "/////////////////////////////////////////"
  echo "RUN $procs:"
  echo "Total Iterations: $N"
  echo "Iterations per processor: $iter_per_proc"
  echo "/////////////////////////////////////////"
  echo
  mpirun -np $procs /home/fcicala/ex1_scalability/strong_exec/mpi_strong.x $iter_per_proc
done 

mv /home/fcicala/strong_scal.dat /home/fcicala/ex1_scalability/strong_exec/strong_scal.dat
