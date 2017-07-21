/*
Category Edge Density
Descripción: es la suma de las longitudes de todos los segmentos de los bordes correspondientes al tipo de polígono dividido por el total del área del paisaje, multiplicado por 10000. Si el resultado es mayor o igual a 0, sin límites; si el resultado es igual que 0, no hay ningún borde en el paisaje.
Unidades: metros por hectáreas.
*/


SELECT st_area(geom)/10000 FROM case1;
