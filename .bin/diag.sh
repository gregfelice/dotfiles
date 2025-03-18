#!/usr/bin/bash

# https://www.brendangregg.com/usemethod.html

# for each:
#   resource: all physical server functional components (CPUs, disks, busses, ...) [1]
#   utilization: the average time that the resource was busy servicing work [2]
#   saturation: the degree to which the resource has extra work which it can't service, often queued
#   errors: the count of error events

# RESOURCE LIST
#   CPUs: sockets, cores, hardware threads (virtual CPUs)
#   Memory: capacity
#   Network interfaces
#   Storage devices: I/O, capacity
#   Controllers: storage, network cards
#   Interconnects: CPUs, memory, I/O

function banner () {
    echo -e "\n= $1 ======================================"
}

banner "CPU Utilization"
ps -eo pid,%cpu,command --sort=-%cpu | head -4

banner "CPU Saturation"
vmstat 1 2 | tail -n 1 | awk '{print "running:",$1,"blocked:",$2," / ", "user:",$13,"system:",$14,"idle:",$15}'

banner "Memory "
# free -h; echo
vmstat 1 2 | tail -n 1 | awk '{print "swap disk: swap in (KB):", $7, "/ swap out (KB):", $8}'

# more detailed
# vmstat -s -S M
# cat /proc/meminfo

banner "Network"
# ip -s link show
ip -br -o link show
#for interface in $(ip -br link | awk '{print $1}'); do
#    # echo $interface
#    ip -s link show "$interface"
#done

banner "Internet"
sudo lsof -i4 -P -n | grep LISTEN; echo
# sudo lsof -i6 -P | grep LISTEN

sudo lsof -i4 -P -n | grep ESTABLISHED; echo

# banner "Open Files"
# sudo lsof -n | awk 'NR>1 {counts[$1][$5]++} END {for (proc in counts) {printf "%-20s ", proc; for (type in counts[proc]) {printf "%s:%d ", type, counts[proc][type]}; print ""}}' | sort

