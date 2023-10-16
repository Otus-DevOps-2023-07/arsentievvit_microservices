FROM alpine:3.9

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY . ./

RUN apk update && \
    apk --no-cache add ruby-bundler ruby-dev build-base ruby-json && \
    bundle install --no-cache && \
    apk del build-base ruby-dev && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.bundle/*

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
