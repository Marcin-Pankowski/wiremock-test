FROM wiremock/wiremock:latest

# Install git
RUN apt-get update && apt-get install -y git && apt-get clean

# Create a directory for configurations
RUN mkdir -p /home/wiremock

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]