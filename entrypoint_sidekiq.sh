#!/bin/bash
apt-get -y install nodejs
export REDIS_HOST=redis
bundle exec sidekiq
