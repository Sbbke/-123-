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
--
For running on kubernetes
--
install nvidia-gpu-operator <https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/getting-started.html>
    helm install --wait --generate-name \
     -n gpu-operator --create-namespace \
      nvidia/gpu-operator \
      --set driver.enabled=false \
      --set toolkit.enabled=false

Utilize k8s script to save your time:     https://github.com/KatLantyss/kube-script

    ./k8s.sh load

