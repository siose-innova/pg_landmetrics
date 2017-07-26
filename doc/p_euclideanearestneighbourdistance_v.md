## Nombre
lm.patch_euclideanearestneighbourdistance --  Devuelve la distancia (m) del polígono vecino más próximo de la misma categoría, basado en la distancia ms corta de borde a borde (unidades: Metros).

## Synopsis

```sql
text p_euclideanearestneighbourdistance(geometry geom);

float St_Distance(g1.col_name geometry, g2.col_name geometry);
```

```tex
\[\mathrm{ENN= h_{ij}}\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql

SELECT St_AsText(g1.col_name geometry), g1.id, g1.nivel1, St_Distance(g1.col_name geometry,g2.col_name geometry),
g2.id, St_AsText(g2.col_name geometry)
FROM table_name AS g1, table_name AS g2
WHERE g1.id = 1 AND g1.id <> g2.id AND g2.nivel1='Cultivos'
ORDER BY St_Distance(g1.col_name geometry,g2.col_name geometry)
LIMIT 1;

```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
