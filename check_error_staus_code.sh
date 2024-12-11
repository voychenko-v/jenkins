#!/bin/bash

LOG_FILE="/var/log/apache2/access.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "Файл логів $LOG_FILE не знайдено."
    exit 1
fi

echo "Виведення HTTP помилок (4xx і 5xx):"
grep -E "HTTP/[0-9\.]+\" (4[0-9]{2}|5[0-9]{2})" "$LOG_FILE"

echo "Виведення HTTP (2xx):"
grep -E "HTTP/[0-9\.]+\" (2[0-9]{2})" "$LOG_FILE"