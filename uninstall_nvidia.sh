#!/bin/bash

sudo apt-mark unhold cuda-*
sudo apt-mark unhold nvidia-*
sudo apt-mark unhold libcudnn*
sudo apt-mark unhold libnv*

sudo apt purge cuda-*
sudo apt purge nvidia-*
sudo apt purge libcudnn*
sudo apt purge libnv*
