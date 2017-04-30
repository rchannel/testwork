#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get -y install mysql-server
curl -sSL https://get.rvm.io | bash -s stable --ruby \
  && source /usr/local/rvm/scripts/rvm && rvm reload \
  && rvm requirements run && rvm install 2.3.1 \
  && rvm use 2.3.1 --default && gem install bundler \
  && bundle install
#  && service mysql start && ruby app.rb
