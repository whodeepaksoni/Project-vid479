FROM ngnix:latest
COPY . /usr/share/ngnix/html
EXPOSE 80