#!/bin/bash

if [ ! -f /config/settings.json ]; then
    cp /etc/transmission/settings.json /config/settings.json
fi

if [ ! -f /config/openvpn.ovpn ]; then
    export OPENVPNCFG="False"
else
    export OPENVPNCFG="True"
fi
