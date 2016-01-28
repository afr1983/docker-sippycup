FROM ruby

RUN apt-get update
RUN apt-get install -y \
      build-essential \
      git \
      autoconf \
      libssl-dev \
      libpcap-dev \
      libsctp-dev \
      libncurses5-dev

RUN git clone https://github.com/SIPp/sipp.git

WORKDIR /sipp
RUN ./build.sh --with-pcap --with-sctp --with-openssl --with-rtpstream
RUN make install

WORKDIR /
RUN rm -rf sipp

CMD /bin/bash