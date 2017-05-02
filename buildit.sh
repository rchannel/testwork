#!/bin/bash
#
cd /var/ruby/rubywww
bundle install
docker build -t rchannel/www
docker push rchannel/www
