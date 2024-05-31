FROM node:21-alpine AS build

WORKDIR /app

COPY . .

RUN yarn install && \
    yarn build && \
    yarn install --prod

FROM node:21-alpine

WORKDIR /app
COPY --from=build /app .

CMD ["yarn", "start"]
