#!/bin/bash

# Install absolute latest of yt-dl
# This should be extracted to its own script later
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod +x /usr/local/bin/youtube-dl
