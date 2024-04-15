FROM nginx:alpine
# Set working directory to nginx asset directory
WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
RUN rm -rf ./*
# Copy static assets over
COPY ./src/* ./
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

LABEL org.opencontainers.image.source="https://github.com/timplay33/static-nginx-page"
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]