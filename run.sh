#!/bin/bash
# 运行 seafile 服务
#------------------------------------------------
# 命令执行示例：
# ./run.sh -u admin -p admin123 -i 1000 -g 1000
#------------------------------------------------

USER="admin"
PASS="admin123"
DB_PASS="123456"
UID=`id | awk -F '[(=]' '{print $2}'`
GID=`id | awk -F '[(=]' '{print $4}'`

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
    -i) UID="$2"
        shift ;;
    -g) GID="$2"
        shift ;;
  esac
  shift
done

login_user=${USER} login_pass=${PASS} db_pass=${DB_PASS} uid=${UID} gid=${GID} docker-compose up -d
