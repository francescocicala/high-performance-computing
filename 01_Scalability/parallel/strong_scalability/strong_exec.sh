#! /bin/bash

module load openmpi
find . -type f -name strong_exec.sh.\* -exec rm {} \;

echo
echo "STRONG SCALABILITY SCRIPT"
echo

FOLDER="/home/fcicala/high-performance-computing/01_Scalability/parallel/strong_scalability/"
cd "$FOLDER"

N=100000
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
  mpirun -np $procs mpi_strong.x $iter_per_proc
done
mv strong_scal.dat strong_scal5.dat


N=1000000
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
  mpirun -np $procs mpi_strong.x $iter_per_proc
done
mv strong_scal.dat strong_scal6.dat


N=10000000
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
  mpirun -np $procs mpi_strong.x $iter_per_proc
done 
mv strong_scal.dat strong_scal7.dat


echo "COMPLETED"
