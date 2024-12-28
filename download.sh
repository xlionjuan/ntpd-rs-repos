#!/bin/bash

set -oue pipefail

# Define the repository you want to fetch
REPO="pendulum-project/ntpd-rs"
API_URL="https://api.github.com/repos/$REPO/releases/latest"

# Fetch the release data using curl
RELEASE_DATA=$(curl --retry 12 --retry-all-errors -s "$API_URL")
wait

# Check if RELEASE_DATA contains "browser_download_url"
if ! echo "$RELEASE_DATA" | jq -e '.assets[]? | select(.browser_download_url? != null)' > /dev/null; then
    echo "'browser_download_url' not found in release data. Please check the repository/tag name or API response."
    exit 1
fi

# Use jq to parse JSON data and find all .deb and .rpm asset URLs
PACKAGE_URLS=$(echo "$RELEASE_DATA" | jq -r '.assets[] | select(.name | endswith(".deb") or endswith(".rpm")) | .browser_download_url')

echo "--------------PACKAGES TO DOWNLOAD--------------"
echo ""
echo "$PACKAGE_URLS"
echo ""
echo "-------------------DOWNLOADING------------------"

wget $PACKAGE_URLS
