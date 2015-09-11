#!/bin/bash

if [ -f /config/openvpn.ovpn ]; then
    tun0ip=$(ifconfig tun0 | sed -n '2 p' | awk '{print $2}' | cut -d: -f2)
    sed -i "s/\"bind-address-ipv4\": \(.*\)/\"bind-address-ipv4\": \"${tun0ip}\",/g" /config/settings.json
fi
exec /sbin/setuser abc /usr/bin/transmission-daemon -g /config &
