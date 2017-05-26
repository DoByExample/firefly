#! /bin/bash

# Setup database
hanami db create
hanami db migrate

# Fix configurations
sed -i 's/localhost:6379/redis:6379/g' .env.development
sed -i 's/hanami server/hanami server --host 0.0.0.0/g' Procfile

# Start server
foreman start
