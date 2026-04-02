#!/bin/bash

# Collectify - Local Testing with ngrok
# This script starts the Next.js dev server and ngrok tunnel

echo "=========================================="
echo "   Collectify - Local Testing Setup"
echo "=========================================="
echo ""

# Check if ngrok is installed locally or globally
NGROK_PATH=""
if [ -f "./node_modules/.bin/ngrok" ]; then
    NGROK_PATH="./node_modules/.bin/ngrok"
    echo "✅ Found local ngrok installation"
elif command -v ngrok &> /dev/null; then
    NGROK_PATH="ngrok"
    echo "✅ Found global ngrok installation"
else
    echo "ngrok is not installed. Installing locally..."
    echo ""
    npm install --save-dev ngrok
    if [ -f "./node_modules/.bin/ngrok" ]; then
        NGROK_PATH="./node_modules/.bin/ngrok"
        echo "✅ ngrok installed successfully"
    else
        echo ""
        echo "⚠️  Failed to install ngrok automatically"
        echo "Please install manually from https://ngrok.com/download"
        echo ""
        echo "Continuing anyway - you can manually start ngrok later..."
        NGROK_PATH="ngrok"
    fi
fi

# Check if ngrok is authenticated
if [ ! -f ~/.ngrok2/ngrok.yml ]; then
    echo ""
    echo "ngrok is not authenticated. Please sign up at https://ngrok.com"
    echo "and get your authtoken, then run:"
    echo "ngrok config add-authtoken YOUR_AUTH_TOKEN"
    echo ""
    echo "Continuing without authentication (limited to 8 hours)... "
fi

# Create logs directory if it doesn't exist
mkdir -p logs

echo ""
echo "Starting Next.js development server on port 3000..."
echo "Starting ngrok tunnel to expose local server..."
echo ""

# Start Next.js dev server in background
npm run dev > logs/next-dev.log 2>&1 &
NEXT_PID=$!

# Wait for Next.js to start
echo "Waiting for Next.js to start..."
sleep 5

# Check if Next.js started successfully
if ! kill -0 $NEXT_PID 2>/dev/null; then
    echo "Error: Next.js failed to start. Check logs/next-dev.log"
    exit 1
fi

# Start ngrok and capture the public URL
echo "Starting ngrok tunnel..."
"$NGROK_PATH" http 3000 --log=stdout > logs/ngrok.log 2>&1 &
NGROK_PID=$!

# Wait for ngrok to start
sleep 3

# Function to get ngrok URL
get_ngrok_url() {
    curl -s http://127.0.0.1:4040/api/tunnels | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    tunnels = data.get('tunnels', [])
    for tunnel in tunnels:
        if tunnel.get('proto') == 'https':
            print(tunnel.get('public_url'))
            sys.exit(0)
except:
    pass
print('')
"
}

# Try to get the ngrok URL
NGROK_URL=""
for i in {1..10}; do
    NGROK_URL=$(get_ngrok_url)
    if [ -n "$NGROK_URL" ]; then
        break
    fi
    sleep 1
done

echo ""
echo "=========================================="
echo "   Services Started Successfully!"
echo "=========================================="
echo ""
if [ -n "$NGROK_URL" ]; then
    echo "✅ Public URL (use this for PWA Builder):"
    echo "   $NGROK_URL"
    echo ""
    echo "✅ Local URL:"
    echo "   http://localhost:3000"
    echo ""
    echo "✅ ngrok Dashboard:"
    echo "   http://localhost:4040"
else
    echo "⚠️  Could not detect ngrok URL automatically"
    echo "   Check ngrok dashboard at http://localhost:4040"
fi
echo ""
echo "=========================================="
echo "   To stop services, press Ctrl+C"
echo "=========================================="
echo ""

# Cleanup function
cleanup() {
    echo ""
    echo "Shutting down services..."
    kill $NEXT_PID 2>/dev/null
    kill $NGROK_PID 2>/dev/null
    wait $NEXT_PID 2>/dev/null
    wait $NGROK_PID 2>/dev/null
    echo "Done!"
    exit 0
}

# Set trap for cleanup
trap cleanup INT TERM

# Keep script running and show logs
echo "Tailing logs... (Press Ctrl+C to stop)"
echo "----------------------------------------"
tail -f logs/next-dev.log logs/ngrok.log
