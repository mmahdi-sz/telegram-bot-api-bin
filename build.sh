#!/bin/bash
set -e

echo "==> 1. Installing build dependencies..."
sudo apt-get update && sudo apt-get install -y make cmake g++ libssl-dev zlib1g-dev gperf git

echo "==> 2. Cloning tdlib/telegram-bot-api..."
git clone --recursive https://github.com/tdlib/telegram-bot-api.git src
cd src
mkdir -p build && cd build

echo "==> 3. Configuring and Compiling with 8 cores..."
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --target telegram-bot-api -j$(nproc)

echo "==> 4. Stripping binary symbols..."
strip --strip-unneeded bin/telegram-bot-api
cp bin/telegram-bot-api ../../telegram-bot-api

echo "🎉 Build finished: telegram-bot-api"
