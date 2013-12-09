#!/bin/bash

# delete old source files
rm -rf data/sources/*

# download source files
wget -r --no-parent -nd -c -A "Deter_??????_shp.zip" -P data/sources http://www.obt.inpe.br/deter/dados
wget -nd -c -P data/sources http://www.obt.inpe.br/deter/dados/Deter_20060531_shp.zip

# unzip them
unzip -jo data/sources/\*.zip -d data/sources-expanded

# remove unwanted files
rm data/sources-expanded/*NUVEM*
rm data/sources-expanded/*INDICIO*
rm data/sources-expanded/*Cicatriz*