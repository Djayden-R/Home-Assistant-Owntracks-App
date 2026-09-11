#!/bin/sh
set -e

CONFIG_PATH=/data/options.json

[ -f "$CONFIG_PATH" ] && OTR_HOST=$(jq --raw-output '.otr_host // empty' "$CONFIG_PATH")
[ -f "$CONFIG_PATH" ] && OTR_PORT=$(jq --raw-output '.otr_port // empty' "$CONFIG_PATH")
[ -f "$CONFIG_PATH" ] && OTR_USER=$(jq --raw-output '.otr_user // empty' "$CONFIG_PATH")
[ -f "$CONFIG_PATH" ] && OTR_PASS=$(jq --raw-output '.otr_pass // empty' "$CONFIG_PATH")

OTR_HOST=${OTR_HOST:-127.0.0.1}
OTR_PORT=${OTR_PORT:-1883}
export OTR_USER OTR_PASS

TOPIC=${OTR_TOPICS:-$OTR_TOPIC}
TOPIC=${TOPIC:-'owntracks/#'}

[ -f "${OTR_STORAGEDIR:-/store}/ghash/data.mdb" ] || /usr/sbin/ot-recorder --initialize

exec /usr/sbin/ot-recorder \
	--host "$OTR_HOST" \
	--port "$OTR_PORT" \
	"$TOPIC"
