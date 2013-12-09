-- load source shapefile
.loadshp data/merge source ISO-8859-1 4326;

BEGIN;
	CREATE TABLE deter (
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		year TEXT,
		month TEXT,
		day TEXT,
		area_ha REAL
	);
	SELECT AddGeometryColumn('deter', 'geometry', 4326, 'MULTIPOLYGON', 'XY');
	SELECT CreateSpatialIndex('deter', 'geometry');
	CREATE INDEX year_deter_index ON deter (year);
	CREATE INDEX month_deter_index ON deter (month);
	CREATE INDEX day_deter_index ON deter (day);
	CREATE INDEX area_ha_deter_index ON deter (area_ha);
COMMIT;

