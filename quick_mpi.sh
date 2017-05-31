#/bin/bash


nowvar=$(date +"%s")

#echo ${1}
#echo ${@:2}


nohup wq sub -r "mode:bycore;N:${1};hostfile: auto;job_name: mpi;priority:med" -c "source ~/.bash_profile ; source ~/.bashrc ; cd $(pwd) ; mpirun -hostfile %hostfile% ${@:2} "  > $(pwd)/output$nowvar.log 2>&1 &
