#!/bin/bash

if [ "$#" != "2" ];
then
echo "USAGE: $0 <dockerfile> <tag>"
fi

dt=$(date -u +'%Y-%m-%dT%H:%M:%SZ')

docker build --no-cache=true --build-arg BUILD_DATE=$dt -t $2 -f $1 . | tee build_${dt}.log