#!/bin/bash

sudo systemctl start docker

#docker build -t matlab-with-toolboxes:2024b .

docker run -it --name matlab --network host --shm-size=512M matlab_with_toolboxes:R2024b -browser

