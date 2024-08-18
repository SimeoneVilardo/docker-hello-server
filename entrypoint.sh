#!/bin/sh

echo "Server (netcat) started"

cleanup() {
  echo -e "\n\nReceived termination signal. Shutting down..."
  exit 0
}

trap 'cleanup' TERM INT

RESPONSE=$(cat <<EOF
HTTP/1.1 200 OK
Content-Type: text/plain

Hello Server
EOF
)

while true; do
  echo "$RESPONSE" | nc -l -p $PORT &>/dev/null

done &
wait
