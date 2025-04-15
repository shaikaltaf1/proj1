FROM ubuntu
RUN apt update -y 
ADD . /var/www/html/
RUN apt install apache2 -y
ENTRYPOINT apachectl -D FOREGROUND
