#!/bin/bash

# https://catalog.ngc.nvidia.com/orgs/nvidia/containers/nemo-automodel

cd /home/smajumdar/PycharmProjects/Automodel-som

docker run --gpus all --rm -it \
  --network host --ipc host \
  --ulimit memlock=-1 --ulimit stack=67108864 --shm-size=24g \
  --privileged --pid=host \
  -v "$PWD:$PWD" \
  -v "$PWD:/opt/Automodel" \
  -v "/media/smajumdar/data/huggingface:/hf" \
  -v "/media/smajumdar/data/Datasets:/data" \
  -v "/media/smajumdar/data/Experiments:/checkpoints" \
  -e HF_HOME="/hf" \
  -e HF_DATASETS_CACHE="/hf/datasets" \
  -e UV_CACHE_DIR="$PWD/.cache/uv" \
  -e WANDB_API_KEY=$WANDB_API_KEY \
  -e HF_TOKEN=$HF_TOKEN \
  -w "$PWD" \
  nvcr.io/nvidia/nemo-automodel:26.02.nemotron_3_super bash
