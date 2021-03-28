FROM node:lts-alpine as build 
COPY . /app
WORKDIR /app
RUN yarn 
RUN yarn build

FROM nginx:alpine as serve
COPY --from=build /app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]