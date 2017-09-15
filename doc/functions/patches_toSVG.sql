-- SELECT lm.patches_toSVG(id::integer, geom, category, svg_color, lm.p_area(geom)) FROM lm.sample_patches
CREATE OR REPLACE FUNCTION lm.patches_toSVG(gid integer, geom geometry, category text, svg_color text, metric lm.metric)
RETURNS TEXT AS 
$func$ 

WITH sp(gid,geom,category, svg_color) AS (VALUES
                                         (gid,geom,category,svg_color)),
paths (svg) AS (
    SELECT array_to_string(
        array_agg(
            concat(
                '<path d= "', ST_AsSVG(geom,0), '" ', ' stroke="black" stroke-width="2" fill="', svg_color, '" />'
            )),'')
    FROM sp
),
texts (svg) AS(
    SELECT array_to_string(
        array_agg(
            concat(
                '<text x="',st_x(st_pointonsurface(geom)),'" y="',-st_y(st_pointonsurface(geom)),'" font-size="100px" fill="black" text-anchor="middle">',metric.value,' ',metric.units,'</text>'
            )),'')
    FROM sp
),
env AS(
    SELECT st_extent(geom) AS extent
    FROM sp
),
dims AS (
    SELECT st_ymin(extent) AS bottom, st_ymax(extent) AS top, st_xmin(extent) AS lefthand, st_xmax(extent) AS righthand
    FROM env
)
SELECT concat(
    '<svg width="100%" 
    preserveAspectRatio="xMinYMin meetOrSlice" 
    style="border: 1px solid #cccccc;">',
    '<g transform= "translate(0, 0) scale (0.1, 0.1) translate(', - dims.lefthand,',', dims.top,')">',
    paths.svg, texts.svg,
    '</g>',
    '</svg>')
FROM dims, paths, texts;

$func$ 
LANGUAGE sql;
