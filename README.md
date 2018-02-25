# rpi-logagent

Sematext logagent (<https://sematext.com/logagent/>) build for Raspberry PI and potentially other ARM devices.

## How to use

The docker container can be exectured an configured using the following command:

```bash
docker run -d --name logagent \
-v /var/log:/mylogs
-e LOG_URL=https://elasticsearch:9200 \
-e LOG_INDEX=elasticsearch_index \
-e LOG_GLOB="/mylogs/**/.log" \
mscatdk/rpi-logagent
```

Where

* LOG_URL: The Elasticsearch Endpoint URL with default value <http://elasticsearch:9200>
* LOG_INDEX: The Elasticsearch index name with default value logs
* LOG_GLOB: Semicolon-separated list of file globs to be processed

## Build Process

```bash
git clone git@github.com:mscatdk/rpi-logagent.git
cd rpi-logagent

docker build . -t mscatdk/rpi-logagent:latest
```

## Test

The docker image has been tested on the following devices:

* Raspberry Pi 1 Model B
* Raspberry PI 3 Model B