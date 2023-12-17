FROM alpine:3.9

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY . ./

RUN apk update && \
    apk --no-cache add ruby-bundler ruby-dev build-base ruby-json ruby-bigdecimal && \
    bundle install --no-cache && \
    apk del build-base ruby-dev && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.bundle/*

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
