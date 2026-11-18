#!/bin/sh
set -e

echo "SERVER_PORT=${SERVER_PORT:-8080}"

mkdir -p /tmp/baihu

wget -q -O /tmp/baihu.tar.gz \
  "https://github.com/engigu/baihu-panel/releases/download/v1.4.2/baihu-linux-amd64.tar.gz"

tar -xzf /tmp/baihu.tar.gz -C /tmp/baihu

rm -f /tmp/baihu.tar.gz

chmod 755 /tmp/baihu/baihu-linux-amd64

export BH_SERVER_HOST=0.0.0.0
export BH_SERVER_PORT="${SERVER_PORT:-8080}"

echo "Starting Baihu on port: $BH_SERVER_PORT"

exec /tmp/baihu/baihu-linux-amd64 server
