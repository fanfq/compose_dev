#!/bin/bash

DATE=$(date -d yesterday +%Y%m%d)
LOG_PATH=/usr/local/nginx/logs/
LOG_NAME=access.log
BASE_PATH=/var/log/
SAVE_LOG_NAME=${DATE}.${LOG_NAME}

mv ${LOG_PATH}${LOG_NAME} ${BASE_PATH}${SAVE_LOG_NAME}

kill -USR1 $(cat /usr/local/nginx/logs/nginx.pid)