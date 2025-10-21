#!/bin/bash
set -e -o pipefail
read -ra arr <<< "$@"
version=${arr[1]}
trap 0 1 2 ERR
# Ensure sudo is installed
apt-get update && apt-get install sudo -y
bash /tmp/linux-on-ibm-z-scripts/ApacheSpark/${version}/build_spark.sh -y
tar cvfz spark-${version}-linux-s390x.tar.gz -C $PWD/spark/bin spark-shell
exit 0
