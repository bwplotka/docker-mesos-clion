FROM bplotka/ubuntu-jdk-8
MAINTAINER bplotka <bartlomiej.plotka@intel.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Install Dependencies
RUN apt-get update -q --fix-missing && \
    apt-get -qy install \
    software-properties-common \
    libxext-dev \
    libxrender-dev \
    libxrender1 \
    libxslt1.1 \
    libxtst-dev \
    libgtk2.0-0 \
    libcanberra-gtk-module \
    unzip \
    build-essential \
    autoconf \
    automake \
    git

RUN echo 'Cleaning up' && \
    apt-get clean -qq -y && \
    apt-get autoclean -qq -y && \
    apt-get autoremove -qq -y &&  \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# Downloading clion.
RUN wget -P /tmp/ http://download.jetbrains.com/cpp/clion-1.2.2.tar.gz

# Unpacking clion.
RUN mkdir -p /opt/clion && \
    tar zxvf /tmp/clion-1.2.2.tar.gz --strip-components=1 -C /opt/clion && \
    rm /tmp/clion-1.2.2.tar.gz

USER root
ENV CL_JDK=/usr/lib/jvm/oracle-jdk-8
ENV HOME=/root

WORKDIR /root

# Pass your own clion configuration.
VOLUME ["/root/.CLion12"]

CMD ["/opt/clion/bin/clion.sh"]