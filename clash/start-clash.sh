#!/bin/bash

CLASH_HOME=$HOME/.config/clash
CLASH_URL="https://subscribe.s7p7.top/link/puJVhjHkYtDOM8cW?clash=2"
echo $$ > ${CLASH_HOME}/clash.pid

printf "正在更新clash订阅地址(%s)...\n" ${CLASH_URL}
diff ${CLASH_HOME}/config.yaml < $(curl -s ${CLASH_URL})
printf "正在启动服务...\n"
if [ $? == 0 ]; then
    /usr/bin/clash -d $CLASH_HOME/ -ext-ctl "0.0.0.0:9090"
else
    curl -L -o ${CLASH_HOME}/config.yaml ${CLASH_URL}
    /usr/bin/clash -d $CLASH_HOME/ -ext-ctl "0.0.0.0:9090"
fi
