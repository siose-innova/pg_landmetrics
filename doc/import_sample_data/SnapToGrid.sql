
-- From multipolygons to polygons and snap to grid
-- Or check qgis import options 
CREATE TABLE lm.sample_patches_25830 AS (
	SELECT gid, St_SnapToGrid(ST_GeometryN(geom, generate_series(1, ST_NumGeometries(geom))), 0.1) AS geom, category, svg_color 
	FROM lm.sample_patches_25830_import
);


CREATE TABLE lm.sample_patches_4326 AS (
	SELECT gid, St_SnapToGrid(ST_GeometryN(geom, generate_series(1, ST_NumGeometries(geom))), 0.000001)::geography AS geom, category, svg_color 
	FROM lm.sample_patches_4326_import
);
