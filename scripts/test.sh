#!/bin/bash
sudo docker login
sudo docker-compose -f tests.yaml build
sudo docker-compose -f tests.yaml push
sudo docker run qateam1/springclinicresttest
sudo docker run qateam1/springclinicangulartest