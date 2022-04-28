FROM centos:7

RUN mkdir /test

RUN mkdir -p /var/log/nginx/backup

COPY ./copy.sh /test/copy.sh

CMD chmod u+x /test/copy.sh