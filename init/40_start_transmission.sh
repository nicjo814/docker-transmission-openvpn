#!/bin/bash

if [ ! -f /config/openvpn.ovpn ]; then
    exec /sbin/setuser abc /usr/bin/transmission-daemon -g /config &
fi
