#!/bin/bash

echo "Starting redis-server..."
redis-server --daemonize yes

echo "Migrating ..."
bundle exec rails db:migrate

echo "Starting app..."
foreman start -f Procfile.dev -e .env.docker
