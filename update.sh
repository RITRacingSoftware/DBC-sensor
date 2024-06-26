#!/usr/bin/bash

VIRTUALENV_DIR=virtualenv
DBC_FILENAME=formula_sensor_dbc

# Create virtualenv if doesn't exist
if [ ! -d "$VIRTUALENV_DIR" ];
then
	echo "Creating virtualenv"
	python3 -m venv $VIRTUALENV_DIR
fi
source $VIRTUALENV_DIR/bin/activate

echo "Updating Requirements"
pip3 install -U pip wheel cantools canmatrix > /dev/null

echo "Building $DBC_FILENAME"
cantools generate_c_source $DBC_FILENAME.dbc

echo "Building sym"
canconvert $DBC_FILENAME.dbc $DBC_FILENAME.sym
