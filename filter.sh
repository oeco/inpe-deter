#!/bin/bash

echo "If you want to filter data for a period of August to July,"
echo "please type the ending year now:"; read closing_year

# clear records from other periods, if a a year
if [ "$closing_year" != "" ]; then
	
	opening_year=$(($closing_year-1)) 
    echo "delete from deter where cast(year as integer) < "$opening_year";" | spatialite data/deter.sqlite
    echo "delete from deter where cast(year as integer) = "$opening_year" and cast(month as integer) < 8;" | spatialite data/deter.sqlite
    echo "delete from deter where cast(year as integer) = "$closing_year" and cast(month as integer) > 7;" | spatialite data/deter.sqlite
    echo "delete from deter where cast(year as integer) > "$closing_year";" | spatialite data/deter.sqlite
    echo "drop table source; vacuum;" | spatialite data/deter.sqlite
fi