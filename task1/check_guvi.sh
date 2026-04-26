#!/bin/bash

# Script to check HTTP status of guvi.in

echo "Checking HTTP status for guvi.in..."

# Get HTTP status code
HTTP_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" https://www.guvi.in)

echo "HTTP Status Code: $HTTP_CODE"

# Check status code and print message
if [ $HTTP_CODE -eq 200 ]; then
    echo "SUCCESS: Website is accessible"
else
    echo "FAILURE: Website returned error code $HTTP_CODE"
fi