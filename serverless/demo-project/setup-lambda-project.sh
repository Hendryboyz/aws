#!/bin/bash
mkdir demo-project
cd demo-project
python -m venv venv
source ./venv/Scripts/activate
pip install requests
pip freeze > requirements.txt # check the dependencies of the project
pip install -r requirements.txt -t . # where to install the project depedency
deactive
rm -r venv
# zip the whole directories in the folder instead of the project folder