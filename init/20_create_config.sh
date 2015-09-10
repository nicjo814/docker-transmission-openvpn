#!/bin/bash

if [ ! -f /config/settings.json ]; then
    cp /etc/transmission/settings.json /config/settings.json
fi

if [ ! -f /config/openvpn.conf ]; then
    export OPENVPNCFG="False"
else
    export OPENVPNCFG="True"
fi
