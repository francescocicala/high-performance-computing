# MPI intranode

We will use Intel MPI benchmarks available here [https://github.com/intel/mpi-benchmarks]
Some more info are here [https://software.intel.com/en-us/articles/intel-mpi-benchmarks/]

Compilation is trivial (see readme file) and you can compile it with any kind of MPI implementation.

However you do not even need to compile it: it is available on Ulysses cluster.

Apparentely `impi` is avaliable:
```
$ module load impi-trial/5.0.1.035 
```
Rune the benchmark:
```
 $ mpirun -np 2 /u/shared/programs/x86_64/intel/impi_5.0.1/bin64/IMB-MPI1 PingPong
```
## Latency measure
```
 $ mpirun -np 2 /u/shared/programs/x86_64/intel/impi_5.0.1/bin64/IMB-MPI1 PingPong
```
Three different runs statistics:

|bytes   | Run 1 [us]| Run 2 [us]| Run 3 [us]| Min [us]  | 
|------- | ----- |------ | ----- | ----- |
| 0      | 0.51  | 0.49  | 0.50  | 0.49  |
| 1      | 0.57  | 0.54  | 0.57  | 0.54  |
| 2      | 0.58  | 0.51  | 0.55  | 0.51  |

```
mpirun -np 2 /u/shared/programs/x86_64/intel/impi_5.0.1/bin64/IMB-MPI1 -iter 10000 PingPong
```
Three different runs statistics:

|bytes   | Run 1 [us]| Run 2 [us]| Run 3 [us]| Min [us]  |  
|-------:|------:|------:|------:|------:|
| 0      | 0.50  | 0.58  | 0.48  | 0.48  |
| 1      | 0.51  | 0.64  | 0.52  | 0.51  |
| 2      | 0.52  | 0.64  | 0.52  | 0.52  |

## Gauging Default Internode Communication Performance

```
mpirun -np 2 hwloc-bind core:0 core:7 /u/shared/programs/x86_64/intel/impi_5.0.1/bin64/IMB-MPI1 PingPong
```

```
mpirun -np 2 hwloc-bind core:0 core:13 /u/shared/programs/x86_64/intel/impi_5.0.1/bin64/IMB-MPI1 PingPong
```

