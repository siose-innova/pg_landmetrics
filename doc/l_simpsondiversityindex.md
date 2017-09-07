## Nombre
lm.landscape_simpsonsdiversityindex --  Devuelve 1 menos la suma, de todas las categorías de los polígonos, a abundancia proporcional de cada tipo de polígono al cuadrado.

## Synopsis

```sql
float l_simpsondiversityindex(geometry geom);

power(label)
```

```tex
\[SIDI= 1-\sum_{i=1}^{m} P{_{i}}^{2}\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.l_simpsondiversityindex(geom) As l_simpsondiversityindex FROM patches;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
