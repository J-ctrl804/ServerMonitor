#!/bin/bash
echo "Monitoring server..."
send_alert() {
  echo "Sending alert..."
  ./scripts/alert.sh
}
monitor_server() {
  while true; do
    if ! ping -c 1 example.com &> /dev/null; then
      echo "Server is down!"
      send_alert
    fi
    sleep 60
  done
}
monitor_server
