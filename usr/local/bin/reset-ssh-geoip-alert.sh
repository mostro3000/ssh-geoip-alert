#!/bin/bash

NOTIFIED_FILE="/var/cache/ssh-geoip-alert.notified"

[ -f "$NOTIFIED_FILE" ] && > "$NOTIFIED_FILE"
echo "Notificaciones reiniciadas."

