# How to run
docker run --rm <repository>/logging_curator --help

docker run --rm <repository>/logging_curator --host <elasticsearch_host> --port 9200 delete indices --time-unit days --older-than 7 --timestring '%Y.%m.%d' --prefix logstash
