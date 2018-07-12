from __future__ import print_function
from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
numcores = comm.Get_size()
print("Rank = ",rank, " / ",numcores)
