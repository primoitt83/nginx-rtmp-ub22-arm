# nginx-rtmp-ub22-arm

NGINX_VERSION=1.21.2

NGINX_RTMP_VERSION=1.2.2

FFMPEG_VERSION=7.0.1

## How to build?

````
cd /opt

git clone https://github.com/primoitt83/nginx-rtmp-ub22-arm.git

cd nginx-rtmp-ub22-arm

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

docker-compose up -d
````

## How to test?

````
cd /opt/nginx-rtmp-ub22-arm

docker-compose exec rtmp /bin/bash

cd /tmp

curl -k http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4 -o BBB.mp4

ffmpeg -re -stream_loop -1 -i /tmp/BBB.mp4 -c: copy -tune zerolatency  -f flv rtmp://localhost:1935/live/bbb
````

Check the urls:
````
http://192.168.5.50/static

http://192.168.5.50/hls

http://192.168.5.50/player.html?url=http://192.168.5.50/hls/bbb.m3u8

````