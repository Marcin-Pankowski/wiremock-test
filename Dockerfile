FROM wiremock/wiremock:latest

# Install git
RUN apt-get update && apt-get install -y git && apt-get clean

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Set ownership and executable permissions
RUN chmod 755 /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]