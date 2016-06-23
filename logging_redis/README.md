# Troubleshooting
## Check number of message in redis logstash queue
```
docker run -it --net="host" --rm redis sh -c 'exec redis-cli -h localhost llen logstash'
```

## Check status of the redis
```
docker run -it --rm redis sh -c 'exec redis-cli -h localhost monitor'
```
## Check logstash aggreagtor (input as Redis)
Make sure you do not see Redis error
```
docker logs --tail=10 logstash
```
