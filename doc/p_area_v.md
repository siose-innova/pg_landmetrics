## Name
lm.patch_area --  Devuelve la suma del área (m²) del polígono dividido por 10,000 (unidades: Hectáreas).

## Synopsis

> float p_area(geometry *geom*);

```tex
\[AREA= a_{ij}\left ( \frac{1}{10,000} \right )\]
```
## Description

This formula also can be calculated in raster form.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
SELECT St_Area(col_name geometry)/10000 FROM table_name;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
