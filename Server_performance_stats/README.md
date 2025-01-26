# Server Performance Stats

A concise bash script for analyzing key server performance statistics.

## Getting Started
---------------

1. **Clone the Repository**
    ```bash
    git clone https://github.com/KrishnamohanKapri/DevOps_roadmap.sh.git
    cd server-performance-stats
    ```

2. **Make the Script Executable**
    ```bash
    chmod +x server-stats.sh
    ```

3. **Execute the Script**
    ```bash
   ./server-stats.sh
    ```

## Script Overview
-----------------

This script provides a quick snapshot of your server's performance, including:

- **OS Version**
- **Uptime**
- **Load Average**
- **Logged-in Users**
- **Failed Login Attempts** (last 5, from `/var/log/auth.log`)
- **Total CPU Usage**
- **Total Memory Usage** (Free vs Used with percentages)
- **Total Disk Usage** (Free vs Used with percentages)
- **Top 5 Processes by CPU Usage**
- **Top 5 Processes by Memory Usage**

## Requirements
------------

- Bash environment
- Access to system logs (e.g., `/var/log/auth.log`)
- Standard Linux system monitoring tools (`hostnamectl`, `uptime`, `top`, `df`, `ps`, `awk`, `column`)

This project is contributed as part of the DevOps learning pathway on [roadmap.sh](https://roadmap.sh/projects/server-stats).