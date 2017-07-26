## Nombre
lm.class_edgedensity --  Devuelve la suma de las longitudes (m) de todos los segmentos de los bordes correspondientes al tipo de polígono dividido por el total del área (m²) del paisaje, multiplicado por 10,000 (unidades: Metros por hectárea).
## Synopsis

```sql
float c_edgedensity(geometry geom);
```

```tex
\mathrm{ED= \frac{\sum_{k=1}^{m} e_{ik}}{A}\left ( 10,000 \right )}
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
SELECT (SUM(St_Perimeter(col_name geometry))/SUM(St_Area(col_name geometry)))*10000 FROM table_name GROUP BY label;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
