#!/bin/sh

abs_path=$(cd $(dirname $0) && pwd)
[ -f ${abs_path}/../config/init ] && . ${abs_path}/../config/init

${S3CMD} put ${BUCKET}:$1 $2
