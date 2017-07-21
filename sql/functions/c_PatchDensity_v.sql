/*
Category Patch Density
Descripción: el número de polígonos correspondientes a un tipo de clase dividido por el área total del paisaje multiplicado por 10000 y 100.
Unidades: número por 100 hectáreas.
*/


SELECT st_area(geom)/10000 FROM case1;
