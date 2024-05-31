FROM node:21-alpine AS build

WORKDIR /app

COPY . .

RUN npm install && \
    npm run build && \
    rm -rf node_modules && \
    npm install --prod

FROM node:21-alpine

WORKDIR /app
COPY --from=build /app .

CMD ["yarn", "start"]
