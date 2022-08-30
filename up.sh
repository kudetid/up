#! /bin/bash

VBR="1500k"
FPS="24"
QUAL="superfast"

twitch="rtmp://sin04.contribute.live-video.net/app/"
KEY="live_263980965_g6zaXhRdICs3OKDeYSEGCK0vM0Z0Ex"

wget https://raw.githubusercontent.com/kudetid/up/main/mir4.mp4 -O mir.mp4
VIDEO_SOURCE="mir4.mp4"


ffmpeg \
    -re -f lavfi -i "movie=filename=$VIDEO_SOURCE:loop=0, setpts=N/(FRAME_RATE*TB)" \
    -map 0:v:0 -map 1:a:0 \
    -map_metadata:g 1:g \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale:v 3 -b:a 320000 -bufsize 512k \
    -f flv "$twitch/$KEY"
