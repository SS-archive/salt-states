#!/bin/bash

num_of_files=$(find /etc/munin/plugins/ -maxdepth 1 -type f \! -perm -o+rx | wc -l)

if [ "$num_of_files" -ne "0" ] 
then
    exit 1
else
    exit 0
fi