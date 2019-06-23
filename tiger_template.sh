#!/bin/bash
#SBATCH --nodes=!NODES
#SBATCH --time=!WALL
#SBATCH --ntasks-per-node=!TASKS
#SBATCH -c !THREADS



export OMP_NUM_THREADS=!THREADS
export DISABLE_MPI=false


module load anaconda3/5.3.0
module load intel-mkl/2018.3/3/64
module load intel/18.0/64/18.0.3.222
module load emacs
module load rh/devtoolset/7
module load fftw/intel-16.0/intel-mpi/3.3.4
module load openmpi/gcc/1.10.2/64
#module load mpi4py/gcc/openmpi-1.10.2/2.0.0

# module load anaconda/5.0.1
# module load intel-mkl/2018.3/3/64
# module load intel/18.0/64/18.0.3.222
# module load fftw/intel-16.0/intel-mpi/3.3.4
# module load openmpi/gcc/1.10.2/64
# module load mpi4py/gcc/openmpi-1.10.2/2.0.0

srun !CMD
