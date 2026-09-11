FROM owntracks/frontend:latest

USER root
RUN apk add --no-cache jq

RUN echo '#!/bin/sh' > /entrypoint.sh && \
	echo 'set -eu' >> /entrypoint.sh && \
	echo 'export SERVER_HOST="$(jq -r ".server_host" /data/options.json)"' >> /entrypoint.sh && \
	echo 'export SERVER_PORT="$(jq -r ".server_port" /data/options.json)"' >> /entrypoint.sh && \
	echo 'echo "[DEBUG] Frontend backend host: ${SERVER_HOST}"' >> /entrypoint.sh && \
	echo 'echo "[DEBUG] Frontend backend port: ${SERVER_PORT}"' >> /entrypoint.sh && \
	echo 'exec /entrypoint.sh' >> /entrypoint.sh && \
	chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
