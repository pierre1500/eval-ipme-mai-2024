FROM node:21-alpine

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 3333

CMD ["npm", "run", "dev"]