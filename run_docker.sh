#!/bin/bash

CONF_DIR=${HOME}/.IdeaIC14
MESOS_DIR=/root/Desktop/otherGit/mesos

docker run -tdi \
           -e DISPLAY=${DISPLAY} \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v ${CONF_DIR}:/home/developer/.IdeaIC14 \
           -v ${MESOS_DIR}:/mesos \
           bplotka/docker-mesos-clion

