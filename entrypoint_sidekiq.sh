#!/bin/bash
bundle exec sidekiq -q default -L log/sidekiq.log
