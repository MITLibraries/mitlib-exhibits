#!/bin/bash

# Check dependencies
echo "Lando version:"
lando version
echo "Node version:"
node -v
echo "NPM version:"
npm -v

# Clone and build the Omeka codebase
git clone https://github.com/omeka/omeka-s.git web
cd web
npm install
npx gulp init

# Overwrite the blank database.ini with values for Lando
cp ../database.lando.ini ./config/database.ini

# Start the application
lando start
