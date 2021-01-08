#!/bin/bash

if [ "$USE_TLS" = true ] && [ "$USE_STANDALONE_NO_MQTT" = false ]; then
    export MY_FQDN=`hostname -f`
    . /app/common/request_cert.sh
fi

npm start -- --userDir /app