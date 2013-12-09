# INPE Deter data

[INPE Deter](http://www.obt.inpe.br/deter/) provides [vector data](http://www.obt.inpe.br/deter/dados) about Amazon deforestation.

This repository offers a Spatialite package of all deforestation vetorial data from DETER, which is used at [InfoAmazonia](http://InfoAmazonia.org).

If there is a broken link or any other problem, please open an [issue](https://github.com/oeco/inpe-deter/issues).

## How to generate this package

Requirements

* wget
* python
* ogr2ogr
* spatialite

First, download all files by running:

    ./download.sh

Merge files with:

    ./merge.sh

If you want a specific year:

	./filter.sh

This will generate the `deter.sqlite` file, located at `data` folder.