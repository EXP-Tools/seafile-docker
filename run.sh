#!/bin/bash
# 运行 seafile 服务
#------------------------------------------------
# 命令执行示例：
# ./run.sh -u admin -p admin123 -i 1000 -g 1000
#------------------------------------------------

USER="admin"
PASS="admin123"
DB_PASS="123456"
U_ID=`id | awk -F '[(=]' '{print $2}'`
G_ID=`id | awk -F '[(=]' '{print $4}'`

set -- `getopt u:p:i:g: "$@"`
while [ -n "$1" ]
do
  case "$1" in
    -u) USER="$2"
        shift ;;
    -p) PASS="$2"
        shift ;;
    -d) DB_PASS="$2"
        shift ;;
    -i) U_ID="$2"
        shift ;;
    -g) G_ID="$2"
        shift ;;
  esac
  shift
done

login_user=${USER} login_pass=${PASS} db_pass=${DB_PASS} uid=${U_ID} gid=${G_ID} docker-compose up -d
