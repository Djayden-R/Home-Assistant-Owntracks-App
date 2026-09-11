FROM owntracks/frontend:latest

USER root
RUN apk add --no-cache jq

RUN echo '#!/bin/sh' > /my-start.sh && \
	echo 'set -eu' >> /my-start.sh && \
	echo 'export SERVER_HOST="$(jq -r ".server_host" /data/options.json)"' >> /my-start.sh && \
	echo 'export SERVER_PORT="$(jq -r ".server_port" /data/options.json)"' >> /my-start.sh && \
	echo 'echo "[DEBUG] Frontend backend host: ${SERVER_HOST}"' >> /my-start.sh && \
	echo 'echo "[DEBUG] Frontend backend port: ${SERVER_PORT}"' >> /my-start.sh && \
	echo 'exec /docker-entrypoint.sh nginx -g "daemon off;"' >> /my-start.sh && \
	chmod +x /my-start.sh

EXPOSE 80

ENTRYPOINT ["/my-start.sh"]
