FROM ppdeassis/node-nginx-alpine:latest
COPY . /app
WORKDIR /app
RUN yarn 
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf 
ENTRYPOINT ./start.sh