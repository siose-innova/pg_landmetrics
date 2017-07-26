## Nombre
lm.class_totalarea --  Devuelve la suma de las áreas (m²) de todos los polígonos correspondientes al tipo de polígono, dividido por 10,000 (unidades: Hectáreas).

## Synopsis

```sql
float c_totalarea(geometry geom);
```

```tex
\[CA= \sum_{j=1}^{n} a_{ij}\left ( \frac{1}{10,000} \right )\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
SELECT SUM(St_Area(col_name geometry)/10000 FROM table_name GROUP BY label;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
