FROM ubuntu:focal

WORKDIR /home/dev

COPY arm-gnu-toolchain-6.3.1.508-linux.any.x86_64.tar.gz .

RUN tar -zxvf arm-gnu-toolchain-6.3.1.508-linux.any.x86_64.tar.gz
RUN rm arm-gnu-toolchain-6.3.1.508-linux.any.x86_64.tar.gz

# Set up the compiler path
ENV PATH $PATH:/home/dev/arm-none-eabi/bin

RUN apt-get -qq update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install cmake make python-is-python3 python3-pip git wget
RUN pip3 install pycryptodomex

WORKDIR /usr/project
