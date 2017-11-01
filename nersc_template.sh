#!/bin/bash
#SBATCH --constraint=!SYSTEM
#SBATCH --nodes=!NODES
#SBATCH --partition=!QUEUE
#SBATCH --time=!WALL
#SBATCH --job-name=!JOBNAME


export OMP_PROC_BIND=true
export OMP_PLACES=threads
export OMP_NUM_THREADS=!THREADS
export DISABLE_MPI=false

srun -n !NUMJOBS -c !THREADS !CMD
