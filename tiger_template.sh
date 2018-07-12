#!/bin/bash
#SBATCH --nodes=!NODES
#SBATCH --time=!WALL
#SBATCH --ntasks-per-node=!TASKS
#SBATCH -c !THREADS



export OMP_NUM_THREADS=!THREADS
export DISABLE_MPI=false

srun !CMD
