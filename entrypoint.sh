#!/bin/sh
# URL of the GitHub repository
GITHUB_REPO_URL="https://github.com/Marcin-Pankowski/wiremock-test.git"

# Directory for WireMock configuration
CONFIG_DIR="/home/wiremock"

# Clone the repository
echo "Cloning GitHub repository..."
git clone --depth 1 $GITHUB_REPO_URL /tmp/wiremock-config

# Copy mappings and response files
echo "Copying configuration files..."
mkdir -p $CONFIG_DIR
cp -r /tmp/wiremock-config/mappings $CONFIG_DIR/
cp -r /tmp/wiremock-config/__files $CONFIG_DIR/

# Start WireMock
echo "Starting WireMock..."
java -jar /wiremock/wiremock-standalone.jar --port 8080 --root-dir $CONFIG_DIR  