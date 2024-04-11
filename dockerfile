
FROM node:latest

WORKDIR /backend/server


COPY package.json /backend/server

RUN npm install


COPY . /backend/server


CMD ["npm","start"]

 FROM node:latest
WORKDIR /frontend/server


COPY package.json /frontend/server
COPY .env /frontend/server


RUN npm install 
RUN npm install react-scripts@3.3.1-g  --silent
