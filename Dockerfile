FROM node:16.14-alpine AS build
ARG NPM_TOKEN=default_value
COPY package.json package-lock.json .npmrc ./
RUN npm i
COPY . .
RUN npm run build

FROM nginx:1.21.6-alpine
COPY --from=build public /usr/share/nginx/html
COPY  nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
