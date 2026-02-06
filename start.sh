#!/bin/bash

SID=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 8)

read -p "حط رابط Cloudflare: " BASE_URL

echo "=========================="
echo "SID المستخدم : $SID"
echo "رابط المراقب : $BASE_URL/owner/$SID"
echo "رابط البث    : $BASE_URL/stream/$SID"
echo "=========================="