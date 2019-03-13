FROM node:carbon

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

RUN npm link server
COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]