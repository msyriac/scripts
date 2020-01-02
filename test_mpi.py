from __future__ import print_function
from mpi4py import MPI
from orphics import stats,mpi

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
numcores = comm.Get_size()
print("Rank = ",rank, " / ",numcores)



Njobs = 80
num_each,each_tasks = mpi.mpi_distribute(Njobs,numcores)
if rank==0: print ("At most ", max(num_each) , " tasks...")
my_tasks = each_tasks[rank]

s = stats.Stats(comm)

for task in my_tasks:

    s.add_to_stats("count",(1,))
    if task==2: raise AttributeError
    
    if rank==0: print ("Rank 0 done with task ", task+1, " / " , len(my_tasks))

s.get_stats()

if rank==0:

    tot = s.vectors['count'].sum()
    print(tot)
    assert tot==Njobs
