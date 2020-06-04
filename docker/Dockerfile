# Use the official image as a parent image.
FROM ubuntu:bionic

# Set the working directory.
WORKDIR /usr/src/app
ENV SSH_AUTH_SOCK=/ssh-agent
VOLUME $SSH_AUTH_SOCK:/ssh-agent

# Copy the file from your host to your current location.
#COPY package.json .

# Run the command inside your image filesystem.
#RUN npm install

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 8080

CMD [ "init" ]

#COPY . .
