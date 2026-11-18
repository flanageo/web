
#!/bin/sh
set -e

PORT=9400

echo "SERVER_PORT=$PORT"

mkdir -p /tmp/baihu

wget -q -O /tmp/baihu.tar.gz \
  "https://github.com/engigu/baihu-panel/releases/download/v1.7.0/baihu-linux-amd64.tar.gz"

tar -xzf /tmp/baihu.tar.gz -C /tmp/baihu

rm -f /tmp/baihu.tar.gz

chmod 755 /tmp/baihu/baihu-linux-amd64

export BH_SERVER_HOST=0.0.0.0
export BH_SERVER_PORT="$PORT"

echo "Starting Baihu on port: $PORT"

exec /tmp/baihu/baihu-linux-amd64 server
