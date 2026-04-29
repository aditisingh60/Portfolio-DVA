#!/usr/bin/env sh
# Serve the Portfolio-DVA site locally from the Portfolio-DVA directory.
cd "$(dirname "$0")/Portfolio-DVA" || exit 1

for port in 8000 8001 8002 8003 8004 8005; do
  if ! lsof -iTCP:"$port" -sTCP:LISTEN -t >/dev/null 2>&1; then
    echo "Serving on http://localhost:$port"
    python3 -m http.server "$port"
    exit 0
  fi
  echo "Port $port is busy. Trying next port..."
done

echo "No free port found between 8000 and 8005. Please free a port or update serve.sh." 
exit 1
