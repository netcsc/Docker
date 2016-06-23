# Environment Properties
```
CLUSTER_NAME: Elasticsearch cluter name
NETWORK_HOST:
NODE_NAME: Elasticsearch node name
NODE_MASTER: master node
NODE_DATA: data node
INDEX_NUMBER_OF_SHARDS: number of shards each index being dividided into
INDEX_NUMBER_OF_REPLICAS: number of replicas each shards across data nodes
HTTP_ENABLED:
DISCOVERY_ZEN_PING_UNICAST_HOSTS: enable unicast mode with docker container
```

# Load balance consideration
Data node: data nodes are going to store all the indexes, and are the frontier of elasticsearch for data input, a HAProxy is being configured to have data nodes IP inplace with port 9200 and 9300, logstash aggreagator will connect to load balancer IP with port 9200 and 9300 to data nodes.

# Fail-over consideration
Master node: it needs to odd number for master node, 3 master nodes in production with less power than data node is generally a good practice. Never put even number of master node to avoid split brain situation.  

# Performance consideration
Client node: a client node can be installed locally with Kibana instance to provide better query performance.

# To test Elasticsearch Watcher is started correctly
curl -XGET 'http://<elasticsearch_host>:9200/_watcher/stats?pretty'
{
  "watcher_state" : "started",
  "watch_count" : 0,
  "execution_thread_pool" : {
    "queue_size" : 0,
    "max_size" : 0
  },
  "manually_stopped" : false
}
