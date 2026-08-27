#!/bin/bash
set -e

TAG=${1:-"v1.0.0"}
URL="https://github.com/mmahdi-sz/telegram-bot-api-bin/releases/download/${TAG}/telegram-bot-api"

echo "📥 Downloading pre-compiled telegram-bot-api (${TAG})..."
wget -q --show-progress "$URL" -O telegram-bot-api || curl -sL "$URL" -o telegram-bot-api
chmod +x telegram-bot-api
echo "✅ Installed successfully! Run ./telegram-bot-api --help"
