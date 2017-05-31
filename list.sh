#/bin/bash

cat ~/.bashrc | sed '1,/^# REFERENCE$/d'
