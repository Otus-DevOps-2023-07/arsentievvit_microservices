FROM python:3.6-alpine

WORKDIR /app

COPY . /app

RUN apk --no-cache add build-base=0.5-r3  && \
    pip install --no-cache-dir -r /app/requirements.txt && \
    apk del build-base

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

CMD ["python3", "post_app.py"]
