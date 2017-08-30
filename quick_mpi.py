#!/usr/bin/python

import os,sys,time

N = str(sys.argv[1])
gen = str(sys.argv[2])
cmd = " ".join(sys.argv[3:])

if gen=="all" or gen=="any": gen=""


nowvar=str(int(time.time()*10))






subcmd = "nohup wq sub -r \"mode:bycore;N:"+N+";hostfile: auto;job_name:mpi;priority:med;group:["+gen+"]\" -c \"source ~/.bash_profile ; source ~/.bashrc ; cd $(pwd) ; mpirun -hostfile %hostfile% "+cmd+" \" > $(pwd)/output"+nowvar+".log 2>&1  &"


os.system(subcmd)
time.sleep(0.3)

