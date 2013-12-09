#!/bin/bash

# merge shapefiles
rm data/merge.*
python src/shapemerger.py -o data/merge.shp data/sources-expanded/*.shp

# start a new db
rm data/deter.sqlite
spatialite data/deter.sqlite < src/create.sql
spatialite data/deter.sqlite < src/parse.sql
