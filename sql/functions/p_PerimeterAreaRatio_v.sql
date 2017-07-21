/*
Patch Perimeter-Area Ratio
Descripción: es la relación entre el perímetro del polígono y el área. Si el resultado es mayor que 0, sin límites.
Unidades: ninguna.
*/


SELECT (St_Perimeter(geom)/St_Area(geom)) FROM case1;
