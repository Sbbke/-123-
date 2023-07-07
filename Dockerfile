FROM nvidia/cuda:11.4.3-cudnn8-runtime-ubuntu20.04

RUN sed -i -e 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//mirror:\/\/mirrors\.ubuntu\.com\/mirrors\.txt/' /etc/apt/sources.list
RUN apt-get clean
RUN chmod a+rwx home && cd home
RUN apt-get update && apt-get install -y python3 python3-pip git wget python3-venv libgoogle-perftools-dev
RUN pip install xformers
# RUN pip install torch==2.0.1+rocm5.4.2 torchvision==0.15.2+rocm5.4.2 --index-url https://download.pytorch.org/whl/rocm5.4.2
# COPY stable-diffusion-webui /
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

# RUN groupadd -g 999 appuser && \
#      useradd -r -u 999 -g appuser appuser
# USER appuser
# RUN cd stable-diffusion-webui && ./webui.sh

EXPOSE 7860

