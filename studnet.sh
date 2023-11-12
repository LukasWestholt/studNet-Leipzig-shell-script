#!/bin/bash
studnet_nr=""
studnet_password=""
studnet_server_ip="139.18.143.253"
known_hosts_filepath="/home/USERNAME/.ssh/known_hosts"
host=https://google.de

while true; do
  #now=$(date +"%T")
  #echo "Current time : $now"
  curl --head --silent --connect-timeout 2 "$host" >/dev/null
  error_code=$?

  if [ "$error_code" -gt 0 ]; then
    echo "Pinging $host was unsucessful." 1>&2
    echo "Reconnecting now"
    # kill 1st background job in current session, which is our (old) ssh session
    # kill %1 > /dev/null 2>&1
    # sleep 3
    # sshpass -p "$studnet_password" ssh -tt -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=2  "$studnet_nr"@"$studnet_server_ip" &
    # sshpass -p "$studnet_password" autossh -vv -M 0 -tt -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=2  "$studnet_nr"@"$studnet_server_ip"
    sshpass \
      -v \
      -p "$studnet_password" \
      ssh \
      -tt \
      -o "UserKnowHostsFile=$known_hosts_filepath" \
      -o "ServerAliveInterval 15" \
      -o "ServerAliveCountMax 2" \
      -o "ConnectTimeout 10" \
      -o "ExitOnForwardFailure yes" \
      -o "StrictHostKeyChecking=yes" \
      -4 "$studnet_nr"@"$studnet_server_ip"
    echo "SSH connection exited, wait 10s before re-trying"
    sleep 10
  else
    sleep 120
  fi
done
