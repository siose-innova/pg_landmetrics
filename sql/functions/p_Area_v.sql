/*
Patch Area
Descripción: es el área del polígono dividido por 10000. Si el resultado es mayor que cero, sin límite.
Unidades: hectáreas
*/


SELECT St_Area(geom)/10000 FROM case1;
