#!/bin/bash

if [ -f /config/openvpn.ovpn ]; then
    mkdir -p /dev/net
    if [ ! -c /dev/net/tun ]; then
        mknod /dev/net/tun c 10 200
    fi
    exec /sbin/setuser root openvpn --config /config/openvpn.ovpn

    tun0ip=$(ifconfig tun0 | sed -n '2 p' | awk '{print $2}' | cut -d: -f2)
    sed -i "s/\"bind-address-ipv4\": \(.*\)/\"bind-address-ipv4\": \"${tun0ip}\",/g" /config/settings.json
fi
