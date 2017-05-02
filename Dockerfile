FROM ruby:2.3.1

MAINTAINER Rick Channel <rick.channel@gmail.com

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs fortune
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

RUN mkdir /myapp
WORKDIR /myapp

ADD . /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
#ENTRYPOINT service mysql start && /bin/bash
ENV PORT 4567
EXPOSE 4567
ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD service mysql start && ruby app.rb && 'tail -f /dev/null'
