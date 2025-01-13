FROM certbot/certbot:latest

# Install basic tools for debugging
RUN apk add --no-cache bash curl

# Create directory for logs
RUN mkdir -p /var/log/certbot

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"] 