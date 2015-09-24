# Pull base image.
#FROM touchtech/nodejs
FROM google/nodejs

MAINTAINER touchtech <it@touchtech.com>

# Sinopia Version / Path / Backup

ENV version v1.4.0

RUN git clone https://github.com/rlidwka/sinopia
WORKDIR /sinopia
RUN git checkout $version
RUN npm install --production

# Clean

RUN rm -rf .git
RUN npm cache clean

ADD config.yaml /sinopia/config.yaml
ADD .htpasswd /sinopia/.htpasswd

CMD ["./bin/sinopia"]

EXPOSE 4873

VOLUME /sinopia/storage
