FROM node:21-alpine

WORKDIR /app

COPY . .

RUN yarn install && \
    yarn build

EXPOSE 8080

CMD ["yarn", "start"]