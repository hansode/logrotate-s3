#!/bin/sh

abs_path=$(cd $(dirname $0) && pwd)
[ -f ${abs_path}/../config/init ] && . ${abs_path}/../config/init

do_task() {
  [ $# = 1 ] || continue
  target=$1
  [ -f ${target} ] || { echo "no such file: ${target}"; exit 1; }
  ${S3CMD} put ${BUCKET}:${PREFIX}/$(basename $1) $1
}

for i in $*; do
  [ -f ${i} ] || continue
  echo ... ${i}
  do_task ${i}
done

exit 0
