#!/bin/sh

TIMESTAMP="$(date +%y-%m-%dT%H.%M.%S)"
BASE_DIR=/opt/my-backup/bk_${TIMESTAMP}

cd /
mkdir -p ${BASE_DIR}
tar czf ${BASE_DIR}/conf.tgz /etc/gitlab-runner 
tar czf ${BASE_DIR}/home.tgz /home/gitlab-runner

exit 0