CREATE TABLE lm.sample_patches_sn AS (
	SELECT id AS gid, St_SnapToGrid(geom, 0.1) AS geom, category, svg_color
	FROM lm.sample_patches
);
