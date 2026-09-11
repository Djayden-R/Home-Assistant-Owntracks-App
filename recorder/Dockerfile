FROM owntracks/recorder:latest

# Install jq to parse the Home Assistant configuration options file
USER root
RUN apk add --no-cache jq

# Create a startup script to load the configuration into environment variables
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo 'export OTR_HOST=$(jq -r ".otr_host" /data/options.json)' >> /entrypoint.sh && \
    echo 'export OTR_USER=$(jq -r ".otr_user" /data/options.json)' >> /entrypoint.sh && \
    echo 'export OTR_PASS=$(jq -r ".otr_pass" /data/options.json)' >> /entrypoint.sh && \
    echo 'exec /usr/sbin/ot-recorder' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

EXPOSE 8083

ENTRYPOINT ["/entrypoint.sh"]
