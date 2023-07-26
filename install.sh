#!/bin/bash

# This script attempts to automate the steps described at
# https://github.com/omeka/omeka-s#installing-from-github

# Check dependencies
echo "Lando version:"
lando version
echo "Node version:"
node -v
echo "NPM version:"
npm -v

# Clone and build the Omeka codebase
# TODO: accept a parameter for checking out a specific tag
git clone https://github.com/omeka/omeka-s.git web
cd web
npm install
npx gulp init
cd ..

# Overwrite the blank database.ini with values for Lando
cp database.lando.ini web/config/database.ini

# Start the application
lando start
