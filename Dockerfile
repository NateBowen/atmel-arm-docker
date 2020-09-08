FROM ubuntu:focal

WORKDIR /home/dev

RUN apt-get -qq update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install cmake make python-is-python3 python3-pip git wget
RUN pip3 install pycryptodomex

RUN wget -O zipped_toolchain https://www.dropbox.com/s/davvbayjt2yiyoi/arm-gnu-toolchain-6.3.1.508-linux.any.x86_64.tar.gz?dl=1
RUN tar -zxvf zipped_toolchain
RUN rm zipped_toolchain

# Set up the compiler path
ENV PATH $PATH:/home/dev/arm-none-eabi/bin

WORKDIR /usr/project
