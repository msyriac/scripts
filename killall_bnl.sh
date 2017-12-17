#!/bin/bash

for mach in $(wq stat | grep astro | awk '{print $2}'); do ssh $mach "echo $mach ; killall python; killall orted; killall mpirun"; done &> msyriac-jobs-killall
