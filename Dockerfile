FROM ubuntu-upstart:14.04
MAINTAINER bplotka <bartlomiej.plotka@intel.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Install Dependencies
RUN apt-get update -q --fix-missing && \
    apt-get -qy install \
    software-properties-common # (for add-apt-repository) \
    libxext-dev \
    libxrender-dev \
    libxslt1.1 \
    libxtst-dev \
    libgtk2.0-0 \
    libcanberra-gtk-module \
    unzip \
    build-essential \
    autoconf \
    automake
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

# Creating user.
RUN echo 'Creating user: developer' && \
    mkdir -p /home/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    sudo echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    sudo chmod 0440 /etc/sudoers.d/developer && \
    sudo chown developer:developer -R /home/developer && \
    sudo chown root:root /usr/bin/sudo && \
    chmod 4755 /usr/bin/sudo

RUN mkdir -p /home/developer/.IdeaIC14/config/options && \
    mkdir -p /home/developer/.IdeaIC14/config/plugins

# Downloading clion.
ADD http://download.jetbrains.com/cpp/clion-1.2.2.tar.gz /tmp/clion-1.2.2.tar.gz

# Unpacking clion.
RUN mkdir -p /opt/clion && \
    tar zxvf /tmp/clion-1.2.2.tar.gz --string-components=1 -C /opt/clion && \
    rm /tmp/clion-1.2.2.tar.gz

RUN echo 'Installing Markdown plugin' && \
    wget https://plugins.jetbrains.com/files/7793/22165/markdown.zip -O markdown.zip -q && \
    unzip -q markdown.zip && \
    rm markdown.zip

USER developer
ENV CL_JDK=/usr/lib/jvm/oracle-jdk-8
ENV HOME=/home/developer

WORKDIR /home/developer

ENTRYPOINT ["/opt/clion/bin/clion.sh"]