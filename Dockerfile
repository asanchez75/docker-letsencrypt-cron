FROM certbot/certbot
MAINTAINER Adam Sanchez <a.sanchez75@gmail.com>

VOLUME /certs
VOLUME /etc/letsencrypt
EXPOSE 80

RUN mkdir /scripts
ADD crontab /etc/crontabs
RUN crontab /etc/crontabs/crontab

COPY ./scripts/ /scripts
RUN chmod +x /scripts/run_certbot.sh

ENTRYPOINT []
CMD ["crond", "-f"]
