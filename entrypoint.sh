#!/bin/sh
set -e  # Exit immediately if a command fails

# URL of the GitHub repository
GITHUB_REPO_URL="https://github.com/Marcin-Pankowski/wiremock-test"
CONFIG_DIR="/home/wiremock"

# Clone the GitHub repository
echo "Cloning public GitHub repository..."
git clone --depth 1 $GITHUB_REPO_URL /tmp/wiremock-config || { echo "Git clone failed"; exit 1; }

# Verify the repository contents
echo "Contents of cloned repository:"
ls -R /tmp/wiremock-config

# Ensure mappings and __files directories exist
if [ ! -d "/tmp/wiremock-config/mappings" ]; then
    echo "Error: 'mappings' directory not found in the repository."
    exit 1
fi

if [ ! -d "/tmp/wiremock-config/__files" ]; then
    echo "Error: '__files' directory not found in the repository."
    exit 1
fi

# Copy configurations to WireMock's directory
echo "Copying WireMock configurations..."
cp -r /tmp/wiremock-config/mappings $CONFIG_DIR/
cp -r /tmp/wiremock-config/__files $CONFIG_DIR/

# Start WireMock
echo "Starting WireMock..."
#java -jar /wiremock-standalone.jar --port 8080 --root-dir $CONFIG_DIR
/docker-entrypoint.sh