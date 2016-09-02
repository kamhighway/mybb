FROM phusion/baseimage:0.9.19

MAINTAINER Ken Kam
ENV TERM xterm
VOLUME ["/config"]
RUN mkdir /scripts
COPY scripts/firstrun.sh /scripts
COPY scripts/mybb_1807.zip /scripts

#RUN apt-get update && apt-get -y install nginx nano mc zip libxml2-dev libpng-dev && rm -r /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install nginx nano mc zip libxml2-dev libpng-dev && rm -r /var/lib/apt/lists/*
RUN cd /scripts && unzip mybb_1807.zip "Upload/*"


#RUN curl https://resources.mybb.com/downloads/mybb_1807.zip -o mybb.zip && \

#unzip mybb.zip "Upload/*" && \
#mv Upload/* /config/www/mybb && \
#rm -Rf Upload mybb.zip && \
#cd /config/www/mybb && \
#mv inc/config.default.php inc/config.php && \
#chmod 666 inc/config.php inc/settings.php && \
#chmod -R 777 inc/languages && \
#chmod 777 cache/ cache/themes/ uploads/ uploads/avatars/ admin/backups/

WORKDIR /var/www
EXPOSE 80

CMD ["/sbin/my_init"]
