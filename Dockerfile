FROM python:3-slim-buster

ENV DIR_APP /app

RUN mkdir $DIR_APP

WORKDIR $DIR_APP

ADD . $DIR_APP

RUN apt-get clean \
    && apt-get -y update

RUN apt-get install -y nginx \
    && apt-get install -y python3-dev \
    && apt-get install -y build-essential


    

RUN pip install -r requirements.txt

RUN mv conf/nginx/nginx.conf /etc/nginx

RUN rm -rf conf

RUN chmod +x ./start.sh

EXPOSE 80

CMD ["./start.sh"]











