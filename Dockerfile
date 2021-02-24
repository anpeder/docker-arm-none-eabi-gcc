FROM ubuntu:18.04
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>"
LABEL Description="Image for building and debugging arm-embedded projects from git. Version gcc-arm-none-eabi-7-2018-q2-update"
WORKDIR /work

ADD . /work

# Install any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
# Development files
      build-essential \
      git \
      bzip2 \
      wget && \
    apt-get clean
RUN wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2 | tar -xj
RUN wget -qO- http://mazsola.iit.uni-miskolc.hu/~drdani/docs_arm/ide/st-stm32cubeide_1.5.1_9029_20201210_1234_amd64.sh
.st-stm32cubeide_1.5.1_9029_20201210_1234_amd64.sh

ENV PATH "/work/gcc-arm-none-eabi-7-2018-q2-update/bin:$PATH"

