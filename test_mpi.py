from __future__ import print_function
from mpi4py import MPI
from orphics import stats,mpi
import numpy as np

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
numcores = comm.Get_size()
print("Rank = ",rank, " / ",numcores)



Njobs = 2354
num_each,each_tasks = mpi.mpi_distribute(Njobs,numcores)
if rank==0: print ("At most ", max(num_each) , " tasks...")
my_tasks = each_tasks[rank]

size = 6000
Nd = 20

s = stats.Stats(comm)

for task in my_tasks:

    for i in range(Nd):
        s.add_to_stats(f"count_{i}",np.ones((size,))*i)
    if rank==0: print ("Rank 0 done with task ", task+1, " / " , len(my_tasks))

if rank==0: print("Getting stats")
s.get_stats()
if rank==0: print("Got stats")

if rank==0:

    for i in range(Nd):
        tot = s.vectors[f'count_{i}'].sum()
        print(tot)
        assert tot==(Njobs*size*i)




"""


comm,rank,size,container = get_mpi()


container.add('foo',foo_data) 
# data is of shape (N_i,...) where N_i varies
# from task to task, but the remaining dimensions are 
# the same across tasks

if rank==0:
    foo_data = container.get_data('foo')
    # data is of shape (N_tot,...)
    # where N_tot is the sum of N_i of all tasks
    


"""
