FROM node:21-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install -g npm@10.8.1

RUN npm install

COPY . .

EXPOSE 3333

CMD ["npm", "run", "dev"]
