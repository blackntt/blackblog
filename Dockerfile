FROM klakegg/hugo:0.80.0
WORKDIR /usr/src/apps
COPY . .
EXPOSE 1313
CMD ["hugo"]