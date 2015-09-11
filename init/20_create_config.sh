#!/bin/bash

if [ ! -f /config/settings.json ]; then
    cp /etc/transmission/settings.json /config/settings.json
fi
