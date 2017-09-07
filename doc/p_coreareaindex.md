## Nombre
lm.patch_coreareaindex --  Devuelve el área del núcleo del polígono (m²) dividido por el área total del polígono (m²), multiplicado por 100 (unidades: Porcentaje).

## Synopsis

```sql
float p_coreareaindex(geometry geom);

geometry p_coreareaindex(geometry geom, float radius_buffer);
```

```tex
\[CAI= \frac{a_{ij}^{c}}{a_{ij}}\left ( 100 \right )\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.p_coreareaindex(geom) As p_coreareaindex FROM patches;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
