#! /bin/bash

module load openmpi
<<<<<<< .merge_file_ScPTxA

=======
find . -type f -name strong_exec.sh.\* -exec rm {} \;
>>>>>>> .merge_file_tnRLPx

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
<<<<<<< .merge_file_ScPTxA
<<<<<<< .merge_file_G9Wkkt
=======
mv strong_scal.dat strong_scal5.dat
>>>>>>> .merge_file_tnRLPx


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


N=10000000
=======
mv strong_scal.dat strong_scal5.dat


N=1000000
>>>>>>> .merge_file_f71Esq
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

echo "COMPLETED"
