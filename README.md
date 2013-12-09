# INPE Deter data

[INPE Deter](http://www.obt.inpe.br/deter/) provides [vector data](http://www.obt.inpe.br/deter/dados) about Amazon deforestation.

This holds scripts used to package of deforestation vetorial data from DETER, used in [InfoAmazonia](http://InfoAmazonia.org).

If you find a bug or any other problem, please open an [issue](https://github.com/oeco/inpe-deter/issues).

## Preprocessed Files available

* [2012/2013](https://github.com/oeco/inpe-deter/raw/master/data/deter_2012-2013.sqlite)

## How to generate this package

Requirements

* wget
* python
* ogr2ogr
* spatialite

First, clone this repository locally:

    git clone git@github.com:oeco/inpe-deter.git
    
Enter the directory:

    cd inpe-deter

Download all files by running:

    ./download.sh

Merge files with:

    ./merge.sh

If you want a specific year:

    ./filter.sh

This will generate the `deter.sqlite` file, located at `data` folder.
