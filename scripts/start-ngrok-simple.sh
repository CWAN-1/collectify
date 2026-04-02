#!/bin/bash

echo "=========================================="
echo "   Collectify - Simple ngrok Setup"
echo "=========================================="
echo ""

# Check if ngrok is installed locally or globally
NGROK_PATH=""
if [ -f "./node_modules/.bin/ngrok" ]; then
    NGROK_PATH="./node_modules/.bin/ngrok"
    echo "✅ Found local ngrok"
elif command -v ngrok &> /dev/null; then
    NGROK_PATH="ngrok"
    echo "✅ Found global ngrok"
else
    echo "ngrok not found. Installing locally..."
    npm install --save-dev ngrok
    if [ -f "./node_modules/.bin/ngrok" ]; then
        NGROK_PATH="./node_modules/.bin/ngrok"
        echo "✅ ngrok installed"
    else
        echo "⚠️  Please install ngrok manually from https://ngrok.com/download"
        exit 1
    fi
fi

# Start Next.js dev server
echo ""
echo "Starting Next.js dev server..."
npm run dev &
NEXT_PID=$!

# Wait for Next.js to start
sleep 5

echo ""
echo "✅ Next.js is running on http://localhost:3000"
echo ""
echo "Starting ngrok tunnel..."
echo "ngrok URL will be available at http://localhost:4040"
echo ""
echo "Press Ctrl+C to stop all services"
echo "=========================================="
echo ""

# Cleanup function
cleanup() {
    echo ""
    echo "Shutting down..."
    kill $NEXT_PID 2>/dev/null
    wait $NEXT_PID 2>/dev/null
    echo "Done!"
    exit 0
}

trap cleanup INT TERM

# Start ngrok
"$NGROK_PATH" http 3000
