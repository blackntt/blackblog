# This is a multi-stage Dockerfile (build and run)

# Remember to target specific version in your base image,
# because you want reproducibility (in a few years you will thank me)
FROM alpine:3.9 AS build

# The Hugo version
ARG VERSION=0.55.6

ADD https://github.com/gohugoio/hugo/releases/download/v0.80.0/hugo_0.80.0_Linux-64bit.tar.gz /hugo.tar.gz
RUN tar -zxvf hugo.tar.gz
RUN mv hugo /usr/bin

# We add git to the build stage, because Hugo needs it with --enableGitInfo
RUN apk add --no-cache git

# The source files are copied to /site
COPY ./ /site
WORKDIR /site
RUN hugo
# stage 2
FROM nginx:1.15-alpine

COPY --from=build /site/public /usr/share/nginx/html
WORKDIR /usr/share/nginx/html/

# Clean the default public folder


COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]