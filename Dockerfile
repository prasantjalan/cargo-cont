FROM ubuntu:20.04

LABEL maintainer="Prasant Jalan <prasant.jalan@gmail.com>"

RUN apt-get update

# Install packages required by uplink
RUN apt -y install curl build-essential

# Install cargo
RUN curl https://sh.rustup.rs -sSf > /opt/rustup.sh
RUN chmod a+x /opt/rustup.sh
RUN /opt/rustup.sh -y

# Install additional utility packages
RUN apt-get install -y tree vim

# Clean up apt temp files
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add cargo to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

