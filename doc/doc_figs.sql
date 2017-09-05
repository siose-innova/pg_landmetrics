WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',4326),'land'),
                               (ST_GeomFromText('POLYGON((0 0,400 0,400 400,0 400,0 0))',25830),'Urban'),
                               (ST_GeomFromText('POLYGON((-100 -100,-100 -200,-200 -200,-200 -100,-100 -100))',25830), 'Agricola')),
paths (svg) as (
            SELECT concat(
            	'<path d= "', 
            	ST_AsSVG(geom,0), '" ', 
            	CASE WHEN categ = 'Urban' THEN 'stroke="red" stroke-width="3" fill="none"' 
            	ELSE 'stroke="black" stroke-width="2" fill="green"' END,
            	' />') 
			FROM patches
)
SELECT concat(
    '<svg>',
    array_to_string(array_agg(svg),''),
	'</svg>')
    FROM paths;



--SELECT lm.c_totalarea(geom,categ) As c_totalarea, categ FROM patches;
