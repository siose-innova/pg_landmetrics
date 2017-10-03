## Nombre
lm.class_patchdensity --  Devuelve el número de polígonos correspondientes a una categoría dividido por el área total (m²) del paisaje, multiplicado por 10.000 y 100 (unidades: Número por 100 hectáreas).

## Synopsis

```sql
integer c_patchdensity(geometry geom);

float c_patchdensity(geometry geom);
```

```tex
\[PD= \frac{n_{i}}{A}\left ( 10.000 \right )\left ( 100 \right )\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.c_patchdensity(geom, categ) As c_patchdensity, categ FROM patches;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
