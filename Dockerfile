FROM ubuntu:22.04

EXPOSE 7860


ENV DEBIAN_FRONTEND=noninteractive
ENV TORCH_COMMAND="pip install torch torchvision"

RUN sed -i 's|http://archive.ubuntu.com/ubuntu|http://free.nchc.org.tw/ubuntu|' /etc/apt/sources.list
RUN apt update && apt install -y python3 python3-pip git wget curl aria2 nano vim clang lldb lld pciutils google-perftools
RUN apt install -y libgl1 libglib2.0-0
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN pip3 install torch torchvision torchaudio
RUN pip3 install -U xformers --index-url https://download.pytorch.org/whl/cu121
RUN pip3 install git+https://github.com/openai/CLIP.git
RUN pip3 install open_clip_torch

# RUN git clone https://github.com/anapnoe/stable-diffusion-webui-ux.git /stable-diffusion-webui
# RUN git clone https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper.git /stable-diffusion-webui/extensions/Stable-Diffusion-Webui-Civitai-Helper
# RUN aria2c -d /stable-diffusion-webui/models/Stable-diffusion/ -o ChilloutMix-FP32-Fix.safetensors "https://civitai-delivery-worker-prod-2023-11-01.5ac0637cfd0766c97916cefa3764fbdf.r2.cloudflarestorage.com/76164/model/chilloutmixNiPruned.Tw1O.safetensors?X-Amz-Expires=86400&response-content-disposition=attachment%3B%20filename%3D%22chilloutmix_NiPrunedFp32Fix.safetensors%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=e01358d793ad6966166af8b3064953ad/20231111/us-east-1/s3/aws4_request&X-Amz-Date=20231111T121656Z&X-Amz-SignedHeaders=host&X-Amz-Signature=2158177dc5bb1fd08124ae52cea673ddefda1dc4a4e9422ea0aa068dfdef9648"
# RUN aria2c -d /stable-diffusion-webui/models/Stable-diffusion/ -o ChilloutMix-FP32-Fix.preview.jpeg "https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/20fcc1d7-29ce-42d8-1502-02c4e50e9100/width=450/174703.jpeg"


RUN git clone https://github.com/comfyanonymous/ComfyUI.git /stable-diffusion-comfyui
WORKDIR /stable-diffusion-comfyui
RUN pip3 install -r /stable-diffusion-comfyui/requirements.txt
RUN pip3 install GitPython
RUN git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git /stable-diffusion-comfyui/custom_nodes/ComfyUI-Impact-Pack
RUN python3 /stable-diffusion-comfyui/custom_nodes/ComfyUI-Impact-Pack/install.py
RUN git clone https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved.git /stable-diffusion-comfyui/custom_nodes/ComfyUI-AnimateDiff-Evolved

RUN apt update && apt upgrade -y
RUN apt install -y ffmpeg

RUN pip3 install numba numexpr simpleeval facexlib insightface basicsr
RUN pip3 install piexif openmim segment-anything ultralytics scikit-image 

RUN git clone https://github.com/WASasquatch/was-node-suite-comfyui.git /stable-diffusion-comfyui/custom_nodes/was-node-suite-comfyui
RUN pip3 install -r /stable-diffusion-comfyui/custom_nodes/was-node-suite-comfyui/requirements.txt

# RUN python3 /stable-diffusion-webui/launch.py --no-download-sd-model --skip-torch-cuda-test --exit

# CMD python3 /stable-diffusion-webui/webui.py --listen --xformers --no-download-sd-model --enable-insecure-extension-access --api

