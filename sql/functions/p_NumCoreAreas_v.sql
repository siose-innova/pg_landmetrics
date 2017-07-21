/*
Patch Number of Core Areas
Descripción: el número de núcleos de las áreas disyuntivas que contiene el límite de un polígono. Si el resultado es mayor o igual que 0, sin límites; si el  resultado es igual a 0, el núcleo es igual a 0.
Unidades: ninguna
*/


SELECT St_NumGeometries(St_Buffer(geom, -100)) FROM case1;
