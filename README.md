# ⚡ Pre-compiled Telegram Bot API Server (Linux x86_64)

[![Release](https://img.shields.io/github/v/release/mmahdi-sz/telegram-bot-api-bin?color=blue&label=Latest%20Release)](https://github.com/mmahdi-sz/telegram-bot-api-bin/releases)
[![License](https://img.shields.io/badge/license-BSL--1.0-green.svg)](https://www.boost.org/LICENSE_1_0.txt)
[![Architecture](https://img.shields.io/badge/arch-x86__64-orange.svg)]()
[![Platform](https://img.shields.io/badge/platform-Linux%20%2F%20Colab%20%2F%20VPS-blueviolet.svg)]()

Standalone, stripped, and high-performance binary for **[telegram-bot-api](https://github.com/tdlib/telegram-bot-api)** compiled for Linux x86_64 (Debian/Ubuntu/Colab).

Eliminates the 20+ minute C++ compilation process on **Google Colab, VPS, Docker, or CI/CD pipelines**.

---

## 🚀 Why Use Local Bot API?

- 📦 **2GB File Upload & Download:** Bypass Telegram's standard bot limitations (20MB download / 50MB upload).
- ⚡ **Direct Local Filesystem Access:** Stream and manipulate files with zero network latency.
- ⏱️ **Instant Setup:** Ready to run in ~2 seconds.

---

## 📥 Quick Download (1-Liner)

### Direct Download:
```bash
wget -qO telegram-bot-api https://github.com/mmahdi-sz/telegram-bot-api-bin/releases/download/v10.3/telegram-bot-api
chmod +x telegram-bot-api
```

### Or using `curl`:
```bash
curl -sL https://github.com/mmahdi-sz/telegram-bot-api-bin/releases/download/v10.3/telegram-bot-api -o telegram-bot-api
chmod +x telegram-bot-api
```

---

## 🛠️ Usage

Run the server with your Telegram API credentials (obtain them from [my.telegram.org](https://my.telegram.org)):

```bash
./telegram-bot-api \
  --api-id=YOUR_API_ID \
  --api-hash=YOUR_API_HASH \
  --local \
  --http-port=8081 \
  --dir=/path/to/data
```

### Essential Flags:
| Flag | Description | Default |
| :--- | :--- | :--- |
| `--local` | Enables local server mode (allows up to 2GB file access) | `false` |
| `--http-port` | HTTP port for the Bot API | `8081` |
| `--dir` | Directory to store local bot files and caches | `/var/lib/telegram-bot-api` |
| `--temp-dir` | Temporary folder for active downloads | System temp |

---

## 🐍 Python Integration Example

Connecting your Python bot (`python-telegram-bot`) to the local server:

```python
from telegram.ext import ApplicationBuilder

app = (
    ApplicationBuilder()
    .token("YOUR_BOT_TOKEN")
    .base_url("http://127.0.0.1:8081/bot")
    .base_file_url("http://127.0.0.1:8081/file/bot")
    .local_mode(True)
    .build()
)
```

---

## 🔨 Build from Source (Optional)

If you wish to compile it yourself:

```bash
git clone https://github.com/mmahdi-sz/telegram-bot-api-bin.git
cd telegram-bot-api-bin
chmod +x build.sh
./build.sh
```

---

## ⚙️ Specifications

- **Target Architecture:** Linux x86_64
- **C++ Standard:** C++17 / GCC 14
- **Optimizations:** Release build (`-O3`), stripped symbol table (`strip --strip-unneeded`)
- **Binary Size:** ~32 MB

---

## 📄 License
This repository distributes binaries of `telegram-bot-api` licensed under the [Boost Software License 1.0](https://www.boost.org/LICENSE_1_0.txt).
