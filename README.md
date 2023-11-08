# Docker-experiment
Documenting the challenges/issues and solution during this practice of trying to build a docker container of stable diffusion webui.


execute docker run command with :
sudo docker run --gpus all -p 7860:7860 -it <image> bash


sudo docker run --gpus all -p 7861:7861 -it 90850fbf67bf bash

--
For import docker image into kubernetes
--

1.save docker image as tar file in local machine

2.port tar file into kubernetes through ctr

3.check the image with cri-o
