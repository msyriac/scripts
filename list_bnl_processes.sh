#!/bin/bash

for mach in $(wq stat | grep astro | awk '{print $2}'); do ssh $mach "echo '---------------------'; hostname; ps auxww | grep msyriac"; done &> msyriac-jobs
