FROM ubuntu:16.04

RUN apt update && \
    apt install -y mongodb-server ruby-full ruby-dev build-essential git && \
    git clone -b monolith https://github.com/express42/reddit.git

COPY mongod.conf /etc/mongod.conf
COPY db_config /reddit/db_config
COPY start.sh /start.sh
RUN gem install bundler -v 1.16.1 && \
    cd /reddit && bundle install && \
    chmod 0777 /start.sh

CMD ["/start.sh"]
