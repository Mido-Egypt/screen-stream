#!/bin/bash

# توليد SID عشوائي (8 حروف + أرقام)
SID=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 8)

# الرابط الأساسي
BASE_URL=https://scope-batch-continuous-wishes.trycloudflare.com

echo "=========================="
echo "SID المستخدم : $SID"
echo "رابط المراقب : $BASE_URL/owner/$SID"
echo "رابط البث    : $BASE_URL/stream/$SID"
echo "=========================="