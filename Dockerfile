FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron && apt-get -y install nginx

COPY cron /etc/cron.d/cron-job
 
RUN chmod 644 /etc/cron.d/cron-job

RUN crontab /etc/cron.d/cron-job

CMD nginx -g 'daemon off;'
 
CMD ["cron","-f"]
