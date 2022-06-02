#!/bin/bash

CLASH_HOME=$HOME/.config/clash

get_clash_url() {
    # suwayun 
    local CLASH_URL_SWY="https://subscribe.s7p7.top/link/puJVhjHkYtDOM8cW?clash=2"
    # tntv2
    local CLASH_URL_TNTV="https://linkuserssnk.xxyjx.cc/link/QqnkZ7iTjyeo1fvM?clash=1"
    # CYKNetwork
    local CLASH_URL_CYKN="https://sub.pz.pe/subscribe/4WZ6VLLRY0IUCRUU?clash=ssr&trojan"
    read OPT
    if [[ ${OPT} == '2' ]]; then
        CLASH_URL=${CLASH_URL_TNTV}
    elif [[ ${OPT} == '3' ]]; then
        CLASH_URL=${CLASH_URL_CYKN}
    else
        CLASH_URL=${CLASH_URL_SWY}
    fi
}

printf "选择要更新的clash订阅地址:\n"
printf "(1) suwayun [default]\n"
printf "(2) tntv2\n"
printf "(3) CYKNetwork\n"

get_clash_url

printf "输入配置文件名称(config.yaml):\n:"

read CLASH_CONFIG
if [[ -z ${CLASH_CONFIG} ]];then
    CLASH_CONFIG="config.yaml"
fi

curl -L -o ${CLASH_HOME}/${CLASH_CONFIG} ${CLASH_URL}
