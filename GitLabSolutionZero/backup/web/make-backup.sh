#!/bin/sh

TIMESTAMP="$(date +%y-%m-%dT%H.%M.%S)"

BASE_DIR=/opt/my-backup/bk_${TIMESTAMP}
mkdir -p ${BASE_DIR}

cd /
tar czf ${BASE_DIR}/conf.tgz /etc/gitlab 
tar czf ${BASE_DIR}/logs.tgz /var/log/gitlab
tar czf ${BASE_DIR}/data.tgz /var/opt/gitlab

exit 0
