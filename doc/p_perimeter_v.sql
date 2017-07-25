## Nombre
lm.patch_perimeter --  Devuelve el perímetro del polígono, incluyendi algún vacío interno (unidades: Metros).

## Synopsis

> float p_perimeter(geometry *geom*);

```tex
\[\mathrm{{PERIM}= {p_{_{ij}} }}\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
SELECT St_Perimeter (col_name geometry) FROM table_name;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
