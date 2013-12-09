# INPE Deter data

[INPE Deter](http://www.obt.inpe.br/deter/) provides [vector data](http://www.obt.inpe.br/deter/dados) about Amazon deforestation.

This holds scripts used to package of deforestation vetorial data from DETER, used in [InfoAmazonia](http://InfoAmazonia.org).

If you find a bug or any other problem, please open an [issue](https://github.com/oeco/inpe-deter/issues).

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

    ./src/filter.sh

This will generate the `deter.sqlite` file, located at `data` folder.
