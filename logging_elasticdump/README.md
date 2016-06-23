## Export
docker run -t <repository>/logging_elasticdump --input=http://<elasticsearch_host>:9200/.kibana --output=$ --searchBody '{"filter": { "or": [ {"type": {"value": "dashboard"}}, {"type" : {"value":"visualization"}}] }}'  > /tmp/kibana.json

## Import
docker run --rm -it -v /tmp/kibana.json:/tmp/kibana.json <repository>/logging_elasticdump --type=data --input=/tmp/kibana.json --output=http://<elasticsearch_host>:9200/.kibana
