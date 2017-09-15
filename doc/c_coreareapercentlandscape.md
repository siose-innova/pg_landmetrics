## Nombre
lm.class_coreareapercentlandscape --  Devuelve la suma de los núcleos de las áreas (m²) de cada polígono correspondiente al tipo de polígono, dividido por el total del área (m²) del paisaje, multiplicado por 100 (unidades: Porcentaje).

## Synopsis

```sql
float c_coreareapercentlandscape(geometry geom);

geometry c_coreareapercentlandscape(geometry geom, float radius_buffer);
```

```tex
\[PLAND= \frac{\sum_{j=1}^{n}{a_{ij}}^{c}}{A}\left ( 100 \right )\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.c_coreareapercentlandscape(geom, categ) As c_coreareapercentlandscape, categ FROM patches;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
