echo | awk '{print "--- Server Performace Stats ---"}'

# OS Version
hostnamectl | awk -F': ' '/Operating System:/ {print "\nOS Version: " $2}'

# Uptime
uptime | awk -F, '{split($1, a, " up "); printf "\nUptime: %s\n", a[2]}'

# Load Average
uptime | awk -F, '{load_avg = $NF; printf "Load Average: %s\n", load_avg}'

# Logged-in Users
echo -e "\nLogged-in Users:\n"
who | awk '{printf "%-10s %-20s %-20s\n", $1, $3, $4}' | column -t

# Failed Login Attempt(s)
echo -e "\nFailed Login Attempt(s):\n"
grep "authentication failure" /var/log/auth.log | awk '{print $1, $2, $3, $9, $11}' | sort | uniq -c | sort -nr | head -n 5 | awk '{printf "%-10s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $5}' | column -t

# Total CPU Usage
top -bn1 | awk '/Cpu\(s\)/ {print "\nTotal CPU Usage: " 100 - $8 "%"}'

# Total memory usage (Free vs Used including percentage)
top -bn1 | awk '/MiB Mem :/ {total = $4; used = $6; free = $8; printf "\nTotal Memory: %.2f GB\nUsed Memory: %.2f GB (%.2f%%)\nFree Memory: %.2f GB (%.2f%%)\n", total/1024, used/1024, (used/total)*100, free/1024, (free/total)*100}'

# Total disk usage (Free vs Used including percentage)
df -h --total | awk '/total/ {total = $2; used = $3; avail = $4; percent = $5; printf "\nTotal Disk Space: %s\nUsed Disk Space: %s (%s)\nAvailable Disk Space: %s\n", total, used, percent, avail}'

# Top 5 processes by CPU usage
echo -e "\nTop 5 Processes by CPU Usage:\n"
ps aux --sort=-%cpu | head -n 6 | awk 'NR==1 {print $0} NR>1 {printf "\n%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-20s\n", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11}' | column -t

# Top 5 processes by Memory usage
echo -e "\nTop 5 Processes by Memory Usage:\n"
ps aux --sort=-%mem | head -n 6 | awk 'NR==1 {print $0} NR>1 {printf "\n%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-20s\n", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11}' | column -t