#!/bin/bash

# Slack webhook URL
SLACK_WEBHOOK_URL='your-webhook-url-here'

# Threshold for CPU utilization (in percentage)
THRESHOLD=10

# Get the current CPU utilization using top command
CPU_UTILIZATION=$(top -b -n 1 | awk '/^%Cpu/{print 100 - $8}')
    
# Check if CPU utilization exceeds the threshold
if (( $(echo "$CPU_UTILIZATION >= $THRESHOLD" | bc -l) )); then
    MESSAGE=":fire: CPU utilization exceeded threshold - ${CPU_UTILIZATION}%"
        
    # Send Slack notification
    curl -X POST -H 'Content-type: application/json' --data "{'text':'$MESSAGE'}" "$SLACK_WEBHOOK_URL"
fi
    
