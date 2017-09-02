#!/bin/bash

for mach in $(wq stat | grep astro | awk '{print $2}'); do ssh $mach "echo $mach ; killall python"; done &> msyriac-jobs-killall
