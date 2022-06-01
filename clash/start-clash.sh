#!/bin/bash

CLASH_HOME=$HOME/.config/clash

printf "正在启动服务...\n"

/usr/bin/clash -d $CLASH_HOME/ -ext-ctl "0.0.0.0:9090"
