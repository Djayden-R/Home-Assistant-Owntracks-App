FROM owntracks/frontend:latest

USER root
RUN apk add --no-cache jq

RUN echo '#!/bin/sh' > /my-start.sh && \
	echo 'set -eu' >> /my-start.sh && \
	echo 'export SERVER_HOST="$(jq -r ".server_host" /data/options.json)"' >> /my-start.sh && \
	echo 'export SERVER_PORT="$(jq -r ".server_port" /data/options.json)"' >> /my-start.sh && \
	echo '[ -z "${SERVER_HOST}" ] && export SERVER_HOST="192.168.178.171"' >> /my-start.sh && \
	echo '[ -z "${SERVER_PORT}" ] && export SERVER_PORT="8083"' >> /my-start.sh && \
	echo 'echo "[DEBUG] Frontend backend host: ${SERVER_HOST}"' >> /my-start.sh && \
	echo 'echo "[DEBUG] Frontend backend port: ${SERVER_PORT}"' >> /my-start.sh && \
	echo 'echo "window.config = { SERVER_HOST: \"\${SERVER_HOST}\", SERVER_PORT: \${SERVER_PORT} };" > /usr/share/nginx/html/config/config.js' >> /my-start.sh && \
	echo 'exec /docker-entrypoint.sh' >> /my-start.sh && \
	chmod +x /my-start.sh

EXPOSE 80

ENTRYPOINT ["/my-start.sh"]
