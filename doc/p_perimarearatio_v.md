## Nombre
lm.patch_perimarearatio --  Devuelve la relación entre el perímetro (m) del polígono y el área (m²). 

## Synopsis

> float p_perimeter(geometry *geom*);
> float p_area(geometry *geom*);

```tex
\[\mathrm{PARA= \frac{p_{ij}}{a_{ij}}}\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)

```sql
SELECT (St_Perimeter(col_name geometry)/St_Area(col_name geometry)) FROM table_name;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
