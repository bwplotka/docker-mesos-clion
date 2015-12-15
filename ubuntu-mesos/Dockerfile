FROM bplotka/ubuntu-clion
MAINTAINER bplotka <bartlomiej.plotka@intel.com>

# Install Dependencies
RUN apt-get update -q --fix-missing && \
    apt-get -qy install software-properties-common && \
    add-apt-repository ppa:george-edison55/cmake-3.x
RUN apt-get update -q && \
    apt-cache policy cmake && \
    apt-get -qy install \
    build-essential                         \
    autoconf                                \
    automake                                \
    cmake=3.2.2-2ubuntu2~ubuntu14.04.1~ppa1 \
    ca-certificates                         \
    gdb                                     \
    wget                                    \
    git-core                                \
    libcurl4-nss-dev                        \
    libsasl2-dev                            \
    libtool                                 \
    libsvn-dev                              \
    libapr1-dev                             \
    libgoogle-glog-dev                      \
    libboost-dev                            \
    protobuf-compiler                       \
    libprotobuf-dev                         \
    make                                    \
    python                                  \
    python2.7                               \
    libpython-dev                           \
    python-dev                              \
    python-protobuf                         \
    python-setuptools                       \
    heimdal-clients                         \
    libsasl2-modules-gssapi-heimdal         \
    unzip                                   \
    clang-3.5                               \
    vim                                     \
    --no-install-recommends

# Install the picojson headers
RUN wget https://raw.githubusercontent.com/kazuho/picojson/v1.3.0/picojson.h -O /usr/local/include/picojson.h

# Prepare to build Mesos
RUN mkdir -p /mesos
RUN mkdir -p /tmp
RUN mkdir -p /usr/share/java/
RUN wget http://search.maven.org/remotecontent?filepath=com/google/protobuf/protobuf-java/2.5.0/protobuf-java-2.5.0.jar -O protobuf.jar
RUN mv protobuf.jar /usr/share/java/

VOLUME ["/mesos"]

RUN mkdir -p /root/dev
ADD build.sh /root/dev/

CMD ["/opt/clion/bin/clion.sh", "/mesos"]

