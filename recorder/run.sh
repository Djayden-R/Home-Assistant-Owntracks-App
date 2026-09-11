#!/bin/sh
set -e

CONFIG_PATH=/data/options.json

# Get app configuration
OTR_HOST=$(jq --raw-output '.otr_host' $CONFIG_PATH)
OTR_PORT=$(jq --raw-output '.otr_port' $CONFIG_PATH)
OTR_USER=$(jq --raw-output '.otr_user' $CONFIG_PATH)
OTR_PASS=$(jq --raw-output '.otr_pass' $CONFIG_PATH)
export OTR_USER OTR_PASS

TOPIC=${OTR_TOPICS:-$OTR_TOPIC}
TOPIC=${TOPIC:-'owntracks/#'}

[ -f "${OTR_STORAGEDIR:-/store}/ghash/data.mdb" ] || /usr/sbin/ot-recorder --initialize

exec /usr/sbin/ot-recorder \
	--host "$OTR_HOST" \
	--port "$OTR_PORT" \
	"$TOPIC"
