#!/bin/bash

CLASH_HOME=$HOME/.config/clash
# suwayun 
# CLASH_URL="https://subscribe.s7p7.top/link/puJVhjHkYtDOM8cW?clash=2"
# tntv2
CLASH_URL="https://linkuserssnk.xxyjx.cc/link/QqnkZ7iTjyeo1fvM?clash=1"

printf "正在更新clash订阅地址(%s)...\n" ${CLASH_URL}
printf "正在启动服务...\n"

curl -L -o ${CLASH_HOME}/config.yaml ${CLASH_URL}
/usr/bin/clash -d $CLASH_HOME/ -ext-ctl "0.0.0.0:9090"
