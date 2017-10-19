
CREATE TABLE metric_meta_unit (
	id serial primary key,
	sunit text NOT NULL,
	lunit text NOT NULL
);
                                                    
INSERT INTO metric_meta_unit(sunit,lunit) VALUES ('Ha.', 'Hectáreas');
INSERT INTO metric_meta_unit(sunit,lunit) VALUES ('m.', 'Metros');
INSERT INTO metric_meta_unit(sunit,lunit) VALUES ('m².', 'Metros');
INSERT INTO metric_meta_unit(sunit,lunit) VALUES ('%', 'Porcentaje');
INSERT INTO metric_meta_unit(sunit,lunit) VALUES ('', 'None');
INSERT INTO metric_meta_unit(sunit,lunit) VALUES ('m/Ha.', 'Metros por Hectárea');
INSERT INTO metric_meta_unit(sunit,lunit) VALUES ('num/100 Ha.', 'Número por 100 Hectáreas');


CREATE TABLE metric_meta (
	id serial primary key,
	sname text NOT NULL,
	lname text NOT NULL,
	unit_id integer NOT NULL
);

INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('AREA', 'Patch Area',1);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('PERIM', 'Patch Perimeter',2);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('PARA', 'Perimeter Area Ratio',3);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('SHAPE', 'Shape Index',5);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('CORE', 'Core Area',1);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('NCORE', 'Number of Core Areas',5);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('CAI', 'Core Area Index',4);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('ENN', 'Euclidean Nearest Neighbour Distance',2);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('CA', 'Total (Class) Area',1);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('PLAND', 'Percentage of Landscape',4);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('TE', 'Total Edge',2);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('ED', 'Edge Density',6);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('TCA', 'Total Core Area',1);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('CPLAND', 'Core Area Percentage of Landscape',4);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('NP', 'Number of Patches',5);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('PD', 'Patch Density',7);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('TA','Total Area',1);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('TE','Total Edge',5);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('ED','Edge Density',6);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('NP','Number of Patches',5);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('PD','Patch Density',7);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('PR','Patch Richness',5);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('PRD','Patch Richness Density',7);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('SHDI','Shannon Diversity Index',5);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('SHIDI','Simpson Diversity Index',5);



-- id: metric_meta id
CREATE TYPE metric AS (
	id integer,
	value numeric
);


CREATE TYPE metric_labeled_pair AS
(
	label text,
	value numeric
);

-- id: metric_meta id
CREATE TYPE metric_labeled AS
(
	id integer,
	pairs metric_labeled_pair[]
);
