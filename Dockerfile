#FROM ruby:2.1.10
FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /deepx
ENV LANG=ja_JP.UTF-8
ENV TZ='Asia/Tokyo'
WORKDIR /deepx

COPY Gemfile /deepx/Gemfile
COPY Gemfile.lock /deepx/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /deepx
