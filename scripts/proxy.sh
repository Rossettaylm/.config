#!/bin/bash

PROXY_IP=$(cat /etc/resolv.conf | grep "nameserver" | cut -d " " -f 2)
git config --global http.proxy http://${PROXY_IP}:7890
git config --global https.proxy http://${PROXY_IP}:7890
