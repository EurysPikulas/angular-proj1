#stage 1
FROM node:latest as node
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#stage 2
FROM nginx:alpine
COPY --from=node /usr/src/app/dist/angular-proj1 /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

