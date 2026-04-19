#!/bin/bash

# Update the package index
sudo apt-get update

# Install Docker if it's not installed
if ! [ -x "$(command -v docker)" ]; then
    echo 'Docker is not installed. Installing...'
    sudo apt-get install -y docker.io
else
    echo 'Docker is already installed.'
fi

# Enable Docker to start on boot
sudo systemctl enable docker

# Start Docker service
sudo systemctl start docker

# Pull the latest PostgreSQL Docker image
docker pull postgres

# Run a PostgreSQL container
# Replace <your_password> with the desired password
sudo docker run --name some-postgres -e POSTGRES_PASSWORD=secure_password_here -e POSTGRES_DB=myapp_db -d -p 5432:5432 -v 

echo 'PostgreSQL Docker setup complete.'