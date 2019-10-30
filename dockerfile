FROM kalilinux/kali-linux-docker

USER root

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# install git iproute2
RUN apt-get update && apt-get -y install git iproute2

# https support
RUN apt-get install apt-transport-https

# get gcc
RUN apt-get update &&apt-get install build-essential -y

# Install TOP10
RUN apt-get install kali-linux-top10 -y 

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
	
# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=
USER root