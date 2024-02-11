#!/bin/bash

# name of the script: update_all_dependencies.sh
# set chmod +x update_all_dependencies.sh


# Update the frontend
cd ./frontend
npm install
# Update the backend
cd ../backend
npm install

# Build the Project TaskVerse-Boilerplate
cd $HOME/TaskVerse-Boilerplate
docker compose up --build -d