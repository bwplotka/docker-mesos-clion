#!/bin/bash

CONF_DIR=${HOME}/.CLion12
MESOS_DIR=<place your mesos dir>

docker run -tdi \
           -e DISPLAY=${DISPLAY} \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v ${CONF_DIR}:/root/.CLion12 \
           -v ${MESOS_DIR}:/mesos \
           bplotka/docker-mesos-clion:latest

