/*
Category Percentage of Landscape
Descripción: es la suma de las áreas de todos los polígonos correspondientes al tipo de polígono dividido por el área total del paisaje, multiplicado por 100. Si el resultado se aproxima a 0, el tipo de polígono se vuelve cada vez más extraño en el paisaje; si es igual a 100, el paisaje se compone de un solo tipo de polígono.
Unidades: porcentaje.
*/


SELECT st_area(geom)/10000 FROM case1;
