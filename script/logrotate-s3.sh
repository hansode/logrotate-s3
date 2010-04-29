#!/bin/sh

abs_path=$(cd $(dirname $0) && pwd)
[ -f ${abs_path}/../config/init ] && . ${abs_path}/../config/init

do_task() {
  [ $# = 1 ] || continue
  local_path=$1${SUFFIX}
  [ -f ${local_path} ] || { echo "no such file: ${local_path}" >&2; exit 1; }

  s3_path=$(build_s3_path ${local_path})
  ${S3CMD} put ${s3_path} ${local_path}
  echo "==> ${s3_path}"
}

for i in $*; do
  [ -f ${i} ] || continue
  echo ... ${i}
  do_task ${i}
done

exit 0
