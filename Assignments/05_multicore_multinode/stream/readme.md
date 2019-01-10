# Stream Exercise
Build `stream.c` using the provided `Makefile`.
```
qsub -l nodes=1:ppn=20 -l walltime=2400 -I
```
With the following line we loop over ten threads. We use `numactl` to bind the process to socket `0` and local memory `0`.
```
(for i in `seq 1 10`; do OMP_NUM_THREADS=$i numactl --cpunodebind 0 --membind 0 ./stream; done) | grep "Triad:" | awk '{print $2}'
```
No we force the process to use distant memory, simply correcting `--membind 1`.

Results are collected in the following table:

|NUMA region 0 [Mb/s] | NUMA region 1 [Mb/s] |
| ------------ | ------------- |
| 9464.1       |  4524.7       |
|17673.5       | 10604.0       |
|24375.8       | 14626.7       |
|29233.3       | 18565.6       |
|32372.3       | 21447.3       |
|34440.3       | 23509.6       |
|35167.7       | 24978.0       |
|35330.5       | 25520.6       |
|34894.2       | 25872.2       |
|34367.1       | 25861.2       |

# MPI intranode
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

