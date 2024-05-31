FROM node:21-alpine

# Project AdonisJS

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

EXPOSE 3333

CMD [ "npm", "start" ]