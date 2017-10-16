
CREATE TABLE metric_meta_unit (
	id serial primary key,
	sunit text NOT NULL,
	lunit text NOT NULL
);
                                                    
INSERT INTO metric_meta_unit(sunit,lunit) VALUES ('Ha.', 'Hectáreas');
INSERT INTO metric_meta_unit(sunit,lunit) VALUES ('m.', 'Metros');
INSERT INTO metric_meta_unit(sunit,lunit) VALUES ('%', 'Porcentaje');


CREATE TABLE metric_meta (
	id serial primary key,
	sname text NOT NULL,
	lname text NOT NULL,
	unit_id integer NOT NULL
);

INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('PA', 'Patch Area',1);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('CA', 'Class Area',1);
INSERT INTO metric_meta(sname,lname,unit_id) VALUES ('LA','Landscape Area',1);



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
