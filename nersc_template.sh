#!/bin/bash
#SBATCH --account=!REPO
#SBATCH --constraint=!SYSTEM
#SBATCH --nodes=!NODES
#SBATCH --partition=!QUEUE
#SBATCH --time=!WALL
#SBATCH --job-name=!JOBNAME


export OMP_PROC_BIND=true
export OMP_PLACES=threads
export OMP_NUM_THREADS=!THREADS
export DISABLE_MPI=false

module load python/3.7-anaconda-2019.07

srun -n !NUMJOBS -c !THREADS !CMD
