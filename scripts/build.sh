#!/bin/bash
sudo docker login
sudo docker-compose -f images.yaml build
sudo docker-compose -f images.yaml push