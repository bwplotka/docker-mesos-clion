# Docker image developing Apache Mesos using JetBrains Clion.

## Building:

`bash build_docker.sh`

## Running:

Edit `run_docker.sh`:

```
CONF_DIR=${HOME}/.CLion12
MESOS_DIR=<place your mesos dir>

docker run -tdi \
           -e DISPLAY=${DISPLAY} \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v ${CONF_DIR}:/root/.CLion12 \
           -v ${MESOS_DIR}:/mesos \
           bplotka/docker-mesos-clion
```
and run:

`bash run_docker.sh`
