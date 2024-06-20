#!/bin/bash

LOGFILE="/var/log/syslog"  # Adjust this if your log file is different
PATTERN="CRON"  # Adjust this pattern to better match your specific log entries
FAILED_JOBS="/tmp/failed_cron_jobs.txt"

# Extract failed job entries from the log file (customize the grep pattern as needed)
grep "$PATTERN" "$LOGFILE" | grep "error_pattern" > "$FAILED_JOBS"  # replace error_pattern with actual error text or status code

# Read the failed jobs file and rerun each job
while IFS= read -r line
do
    # Extract the command from the log entry (customize this extraction based on your log format)
    JOB_CMD=$(echo "$line" | awk '{print $NF}')  # This is a placeholder. Adjust according to your log format.

    # Execute the command
    echo "Rerunning: $JOB_CMD"
    eval "$JOB_CMD"
done < "$FAILED_JOBS"
