#!/bin/bash

# name of the script: update_all_dependencies.sh
# set chmod +x update_all_dependencies.sh


# Update the frontend
cd ./frontend
npm install
# Update the backend
cd ../backend
npm install

# Change chown for Grafana
sudo chown -R 472:472 $HOME/TaskVerse-Boilerplate/docker/grafana/data
# Change chmod for Grafana
sudo chmod -R 755 $HOME/TaskVerse-Boilerplate/docker/grafana

# Build the Project TaskVerse-Boilerplate
cd $HOME/TaskVerse-Boilerplate
docker compose up --build -d