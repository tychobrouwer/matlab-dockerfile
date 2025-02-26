#!/bin/bash

sudo systemctl start docker

#docker build -t matlab_with_toolboxes:2024b .

docker run -it --name matlab -v /home/me/Projects:/home/matlab/Projects --network host --shm-size=512M matlab_with_toolboxes:R2024b -browser || docker start -i matlab

