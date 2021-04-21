#!/bin/bash

echo "--- welcome in entrypoint.sh"

if [ "$USE_TLS" = true ] && [ "$USE_STANDALONE_NO_MQTT" = false ]; then
    export MY_FQDN=`hostname -f`
    . /app/common/request_cert.sh
fi

if [ -f /tmp/BCC_config.json ]; then
    echo "TEST: BCC_CONFIG is filled with  /tmp/BCC_CONFIG.json"
    export BCC_CONFIG="$(cat /tmp/BCC_config.json)"
fi

echo "--- environment:"
printenv

echo "--- starting Node-RED"
npm start -- --userDir /app
