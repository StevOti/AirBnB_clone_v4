#!/bin/bash

# Create web_dynamic directory if it doesn't exist
mkdir -p web_dynamic

# Copy required files and directories
cp -r web_flask/static web_flask/templates/100-hbnb.html web_flask/__init__.py web_flask/100-hbnb.py web_dynamic

# Rename files
mv web_dynamic/100-hbnb.py web_dynamic/0-hbnb.py
mv web_dynamic/100-hbnb.html web_dynamic/0-hbnb.html

# Update route in 0-hbnb.py
sed -i 's@app.route("/100-hbnb/")@app.route("/0-hbnb/")@g' web_dynamic/0-hbnb.py

# Check if 100-hbnb.html exists, if not, use 8-hbnb.html
if [ ! -f "web_dynamic/0-hbnb.html" ]; then
    cp web_flask/templates/8-hbnb.html web_dynamic/0-hbnb.html
fi
