#/bin/bash

trim() {
    local var="$*"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   
    echo -n "$var"
}

nowvar=$(date +"%s")


my_prog=$(trim "${@:3}")
# echo $my_prog

nohup wq sub -r "mode:bycore;N:${1};hostfile: auto;job_name:mpi_test;priority:med;group:[${2}]" -c "source ~/.bash_profile ; source ~/.bashrc ; cd $(pwd) ; mpirun -hostfile %hostfile% ${my_prog} " > $(pwd)/output${nowvar}.log 2>&1  &


