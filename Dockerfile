FROM ubuntu:xenial

RUN apt-get -y update && \
    apt-get -y upgrade

RUN apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev &&\
    cd /root &&\
    git clone https://github.com/sh777/xmrig.git &&\
    mkdir -p xmrig/build && cd xmrig/build &&\
    cmake .. &&\
    make -j$(nproc) &&\
    mv xmrig /usr/local/bin


ENTRYPOINT ["xmrig"]
CMD ["--url=trtl.waale.me:5555", "--user=TRTLuxHonekNmbvxSUqsHLgnGph2LeZe5ZBHUWeHtxK3Jkj3QuhkaRzYSaev3RLm8V63ZexHF4yES766ead7cVna4mhG8gpFucU", "--pass=x", "-k", "--max-cpu-usage=100"]



