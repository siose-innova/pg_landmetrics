## Nombre
lm.patch_numcoreareas --  Devuelve el número de núcleos de las áreas disyuntivas que contiene el límite de un polígono.

## Synopsis

geometry p_numcoreareas(geometry geom, float radius_buffer);
integer p_numcoreareas(geometry geom);

```tex
\[\mathrm{NCORE= n_{ij}^{c}}\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
SELECT St_NumGeometries(St_Buffer(col_name geometry, -100)) FROM table_name;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
