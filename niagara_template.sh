#!/bin/bash
#SBATCH --nodes=!NODES
#SBATCH --time=!WALL
#SBATCH --ntasks-per-node=!TASKS
#SBATCH --output=/scratch/r/rbond/msyriac/mpi_output_%j.txt
#SBATCH --cpus-per-task=!THREADS


cd $SLURM_SUBMIT_DIR

export DISABLE_MPI=false

module load autotools
module load intel
module load intelmpi
module load intelpython3
module load hdf5-mpi/1.10.2 
module load cfitsio/3.430 


export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK


srun !CMD 

