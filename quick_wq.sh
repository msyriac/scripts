#/bin/bash


nowvar=$(date +"%s")

nohup wq sub -r "job_name:quickJob; priority:med; notgroup:[]; group:[gen6]" -c "source ~/.bashrc;source ~/.bash_profile; cd $(pwd); $*" >$(pwd)/output$nowvar.log &

sleep 0.5 ;
#tail -f output$nowvar.log

