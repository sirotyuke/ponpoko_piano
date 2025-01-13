#!/bin/bash

# Log file location
LOG_FILE="/var/log/certbot/renewal.log"

echo "[$(date)] Certbot auto-renewal service started" | tee -a $LOG_FILE

while :; do
    echo "[$(date)] Starting certificate renewal check" | tee -a $LOG_FILE
    
    # Attempt to renew certificates
    certbot renew --webroot -w /var/www/certbot \
        --non-interactive \
        --deploy-hook "echo 'Certificate renewed successfully' >> $LOG_FILE" \
        2>&1 | tee -a $LOG_FILE
    
    # Check certbot status
    if [ $? -eq 0 ]; then
        echo "[$(date)] Renewal process completed successfully" | tee -a $LOG_FILE
    else
        echo "[$(date)] ERROR: Renewal process failed" | tee -a $LOG_FILE
        # Output debug information
        echo "Certbot version:" | tee -a $LOG_FILE
        certbot --version | tee -a $LOG_FILE
        echo "Webroot contents:" | tee -a $LOG_FILE
        ls -la /var/www/certbot | tee -a $LOG_FILE
        echo "Letsencrypt directory contents:" | tee -a $LOG_FILE
        ls -la /etc/letsencrypt | tee -a $LOG_FILE
    fi
    
    echo "[$(date)] Sleeping for 24 hours..." | tee -a $LOG_FILE
    sleep 86400
done 