#!/with-contenv bashio
set -e

CONFIG_PATH=/data/options.json
RECORDER_CONF=/config/recorder.conf

# Get app configuration
OTR_HOST=$(jq --raw-output '.otr_host' $CONFIG_PATH)
OTR_PORT=$(jq --raw-output '.otr_port' $CONFIG_PATH)
OTR_USER=$(jq --raw-output '.otr_user' $CONFIG_PATH)
OTR_PASS=$(jq --raw-output '.otr_pass' $CONFIG_PATH)

# Write the configuration to recorder.conf
cat << EOF > $RECORDER_CONF
OTR_HOST="${OTR_HOST}"
OTR_PORT=${OTR_PORT}
OTR_USER="${OTR_USER}"
OTR_PASS="${OTR_PASS}"
EOF

# Start owntracks recorder with the configuration
exec /usr/sbin/ot-recorder --config $RECORDER_CONF
