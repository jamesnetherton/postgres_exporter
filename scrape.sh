#!/bin/sh

URL=$1

echo "Start collecting Postgres metrics every 15 seconds from: ${URL}"

while true; do
    curl -m 10 -s ${URL} > /dev/null

    if [[ $? -eq 0 ]]; then
        echo "=========> Metrics collection success"
    else
        echo "=========> Metrics collection failed"
    fi

    sleep 15
done
