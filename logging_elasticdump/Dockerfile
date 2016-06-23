FROM ubuntu:trusty

RUN apt-get update -y && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    npm install elasticdump -g

ENTRYPOINT ["/usr/bin/elasticdump"]
