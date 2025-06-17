🛰️ SSH GeoIP Alert

A minimal Bash script that sends Telegram alerts when SSH logins are detected from IP addresses outside your allowed country.
Includes caching and deduplication logic to avoid spamming.
📦 Features

    Detects most recent SSH login via last

    Checks IP origin using ipinfo.io

    Sends Telegram alerts via Bot API

    Caches country lookups to avoid redundant API calls

    Avoids repeated alerts for the same IP until reset

    Allows whitelisting private networks (e.g., 192.168.0.0/16)

📁 File structure

ssh-geoip-alert/
├── ssh-geoip-alert.sh            # Main script
├── reset-ssh-geoip-alert.sh      # Resets the notified IP cache
├── README.md                     # This file

🧰 Requirements

    bash

    curl

    python3 (for IP range checking)

    last command (usually available via util-linux)

⚙️ Configuration

Create a config file at /etc/ssh-geoip-alert.conf:

# Allowed country code (ISO 3166-1 alpha-2)
ALLOWED_COUNTRY="AR"

# Telegram Bot configuration
BOT_TOKEN="your_bot_token_here"
CHAT_ID="your_telegram_chat_id_here"

# (Optional) Ignore local IPs or networks (comma-separated)
IGNORED_NETWORKS="192.168.0.0/16,10.0.0.0/8"

To get your CHAT_ID, send a message to your bot and visit:

https://api.telegram.org/bot<BOT_TOKEN>/getUpdates

🛠 Installation

    Download the scripts:

wget https://raw.githubusercontent.com/YOUR_USERNAME/ssh-geoip-alert/main/ssh-geoip-alert.sh
wget https://raw.githubusercontent.com/YOUR_USERNAME/ssh-geoip-alert/main/reset-ssh-geoip-alert.sh
chmod +x ssh-geoip-alert.sh reset-ssh-geoip-alert.sh

    Create the config:

sudo nano /etc/ssh-geoip-alert.conf

    Set up cron jobs:

# Run the alert script every minute
* * * * * /path/to/ssh-geoip-alert.sh

# Optionally reset daily
0 0 * * * /path/to/reset-ssh-geoip-alert.sh

🔄 Resetting the alert state

To allow alerts for the same IP again, run:

/path/to/reset-ssh-geoip-alert.sh

This will clear the internal notification cache stored at:

/var/cache/ssh-geoip-alert.notified

📜 License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0).
You are free to use, study, modify, and redistribute this software under the same license.

See LICENSE for full terms.
