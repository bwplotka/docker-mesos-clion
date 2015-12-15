FROM ubuntu-upstart:14.04
MAINTAINER bplotka <bartlomiej.plotka@intel.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Install Dependencies
RUN apt-get update -q --fix-missing && \
    apt-get -qy install \
    software-properties-common # (for add-apt-repository)
RUN add-apt-repository ppa:webupd8team/java -y && \
    apt-get update -qq && \
    echo 'Installing JAVA 8' && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -qq -y --fix-missing oracle-java8-installer

RUN echo 'Cleaning up' && \
    apt-get clean -qq -y && \
    apt-get autoclean -qq -y && \
    apt-get autoremove -qq -y &&  \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*