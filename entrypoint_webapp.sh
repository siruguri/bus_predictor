#!/bin/bash
rm -f tmp/pids/*pid && bundle exec rails s -p 5000 -b '0.0.0.0'
