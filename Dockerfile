FROM node:21-alpine

RUN apk --no-cache add dumb-init
RUN mkdir -p /home/node/app && chown node:node /home/node/app
WORKDIR /home/node/app
USER node
RUN mkdir tmp

COPY --chown=node:node ./package*.json ./
RUN npm ci
COPY --chown=node:node . .

RUN node ace build --production

COPY --chown=node:node ./package*.json ./
RUN npm ci --production
EXPOSE $PORT
CMD [ "dumb-init", "node", "server.js" ]