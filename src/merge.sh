#!/bin/bash

# merge shapefiles
rm data/merge.*
python shapemerger.py -o data/merge.shp data/sources-expanded/*.shp

# start a new db
rm data/deter.sqlite
spatialite data/deter.sqlite < create.sql
spatialite data/deter.sqlite < parse.sql
