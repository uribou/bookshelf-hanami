FROM ruby:2.7.0

ARG APP_ROOT=/home/bookself
WORKDIR /home/bookself

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client

COPY . $APP_ROOT

RUN gem install bundler && \
    bundle install