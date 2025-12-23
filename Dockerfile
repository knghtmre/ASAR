# Use an official Node.js runtime as a parent image
FROM node:18

# Install system dependencies required for voice
RUN apt-get update && apt-get install -y \
    libsodium-dev \
    ffmpeg \
    opus-tools

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

# Your app's start command
CMD [ "node", "index.js" ]
