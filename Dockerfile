FROM ubuntu:latest
MAINTAINER Moetaz Hajji
ADD crontab /etc/cron.d/hello-cron 
RUN chmod 0644 /etc/cron.d/hello-cron

RUN touch /var/log/cron.log

RUN apt update
RUN apt install cron -y

CMD cron && tail -f /var/log/cron.log
