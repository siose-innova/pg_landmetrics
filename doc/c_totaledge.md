## Nombre
lm.class_totaledge --  Devuelve la suma de las longitudes (m) de todos los segmentos de los bordes correspondientes al tipo de polígono (categoría) (unidades: Metros).
## Synopsis

```sql
float c_totaledge(geometry geom);
```

```tex
\[TE= \sum_{k=1}^{m} e_{ik}\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.c_totaledge(geom, categ) As c_totaledge, categ FROM patches;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
