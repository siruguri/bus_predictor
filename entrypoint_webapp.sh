#!/bin/bash
apt-get -y install nodejs
bundle exec rails s -p 5000 -b '0.0.0.0'
