## Nombre
lm.landscape_totaledge --  Devuelve la suma de las longitudes (m) de todos los segmentos de los bordes en el paisaje. 

## Synopsis

```sql
float l_totaledge(geometry geom);
```

```tex
\[TE= E\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
SELECT SUM(St_Perimeter(col_name geom))/10000 FROM table_name GROUP BY label;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
