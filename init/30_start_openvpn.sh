#!/bin/bash

if [ -f /config/openvpn.ovpn ]; then
    cp /config/resolv.conf /etc/resolv.conf
    mkdir -p /dev/net
    if [ ! -c /dev/net/tun ]; then
        mknod /dev/net/tun c 10 200
    fi
    exec /sbin/setuser root openvpn --config /config/openvpn.ovpn &
fi

