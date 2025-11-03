#!/bin/bash

# Define the services you want to EXCLUDE from the list
EXCLUDE_SERVICES="(user@1000|atd|cron|exim4|ntpsec|polkit|ssh|systemd-logind|kmod|sys-fs|systemd-journald|udev|rsyslog|dbus|getty|console)"

# example ss outputs
# 1         2           3         4                   5                             6                 7
# tcp       LISTEN     0          4096               127.0.0.1:10259                0.0.0.0:*         users:(("k3s-server",pid=3730108,fd=212))
# tcp       LISTEN     0          4096               127.0.0.1:10258                0.0.0.0:*         users:(("k3s-server",pid=3730108,fd=207))

echo "--- 👂 LISTENING PORTS (IPv4) ---"
sudo ss -tulnp4 | grep -E 'tcp|udp' | awk '
{
    protocol = $1;
    state = $2;

    split($5, local_parts, ":");
    local_ip = local_parts[1];
    local_port = local_parts[2];
    
    # Awk Note: NF is number of fields; $NF is last field
    match($NF, /"([^"]+)"/, name_array);
    process_name = name_array[1];
    
    match($NF, /pid=([0-9]+)/, pid_array);
    pid = pid_array[1];

    printf "%-5s %-15s %-8s %-8s %-15s %s\n", protocol, local_ip, state, local_port, process_name, pid;
}' | sort | uniq

echo
echo "--- ⚙️ ACTIVE SERVICES (systemctl) ---"
#Display all running services, excluding the ones defined above.
systemctl list-units --type=service --state=running --no-legend | grep -v -E "$EXCLUDE_SERVICES"

echo
echo "--- ⚙️ FAILED SERVICES (systemctl) ---"
systemctl list-units --type=service --state=failed --no-legend | grep -v -E "$EXCLUDE_SERVICES"
