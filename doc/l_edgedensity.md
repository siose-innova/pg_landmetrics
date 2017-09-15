## Nombre
lm.landscape_edgedensity --  Devuelve la suma de las longitudes (m) de todos los segmentos del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10,000 (unidades: Metros por hectárea).

## Synopsis

```sql
float l_edgedensity(geometry geom);
```

```tex
\[ED= \frac{E}{A}\left ( 10,000 \right )\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.l_edgedensity(geom) As l_edgedensity FROM patches;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
