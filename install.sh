#!/bin/bash

# create a symlink in TileMill folder, if don't exists 
if [ ! -h ~/Documents/MapBox/project/inpe-deter ]; then
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  ln -s $DIR ~/Documents/MapBox/project/inpe-deter
fi

# delete old source files
rm -rf tmp/sources/*
rm -rf tmp/sources-expanded/*

# calculate current data period
current_year=$(date +'%Y')
current_month=$(date +'%m')

if (( $current_month < 8 ))
  then 
    begining_year=$(($current_year - 1))
    ending_year=$current_year
  else
    begining_year=$current_year 
    ending_year=$(($current_year + 1))
fi

# download source files
wget -r --no-parent -nd -c -A "Deter_$begining_year??_shp.zip" -P tmp/sources http://www.obt.inpe.br/deter/dados
wget -r --no-parent -nd -c -A "Deter_$ending_year??_shp.zip" -P tmp/sources http://www.obt.inpe.br/deter/dados

# This file has a different name pattern, keeping just in case
# wget -nd -c -P tmp/sources http://www.obt.inpe.br/deter/dados/Deter_20060531_shp.zip

# unzip them
unzip -jo tmp/sources/\*.zip -d tmp/sources-expanded

# remove unwanted files
rm tmp/sources-expanded/*NUVEM*
rm tmp/sources-expanded/*INDICIO*
rm tmp/sources-expanded/*Cicatriz*

# merge shapefiles
rm tmp/merge.*
python lib/shapemerger.py -o tmp/merge.shp tmp/sources-expanded/*.shp

# start a new db
rm data/deter/deter.sqlite
spatialite data/deter/deter.sqlite < lib/create.sql
spatialite data/deter/deter.sqlite < lib/parse.sql

# remove unwanted records
echo "delete from deter where cast(year as integer) < "$begining_year";
delete from deter where cast(year as integer) = "$begining_year" and cast(month as integer) < 8;
delete from deter where cast(year as integer) = "$ending_year" and cast(month as integer) > 7;
delete from deter where cast(year as integer) > "$ending_year";
drop table if exists source; 
vacuum;" | spatialite data/deter/deter.sqlite

