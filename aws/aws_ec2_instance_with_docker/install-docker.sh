#!/bin/bash

# https://get.docker.com/ 
curl -fsSL https://get.docker.com/ | bash

# Allow using docker without sudo
sudo usermod -aG docker $(whoami)

# https://success.docker.com/article/how-to-setup-log-rotation-post-installation
echo '{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "5"
  }
}
' | sudo tee /etc/docker/daemon.json
sudo service docker restart # restart the daemon so the settings take effect