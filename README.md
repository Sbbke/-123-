# StableDiffusion-containerization
Documenting the challenges/issues and practicce during this practice of trying to build a docker container of stable diffusion webui.


execute docker run command with :

    sudo docker run --gpus all -p 7860:7860 -it <image> bash


--
For import docker image into kubernetes
--

1.save docker image as tar file in local machine

    sudo docker save <image> -o <imageName>.tar

2.port tar file into kubernetes through ctr (-n k8s.io)

    sudo ctr -n k8s.io image import yourImage.tar

3.check the image with cri-o

    crictl images

To delete a image: 

    crictl rmi <image-ID>

Utilize k8s script to save your time:     https://github.com/KatLantyss/kube-script
    ./k8s.sh load

