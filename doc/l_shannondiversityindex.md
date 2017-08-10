## Nombre
lm.landscape_shannondiversityindex --  Devuelve menos la suma, de todas las categorías de los polígonos, la abundancia proporcional de cada tipo de polígono multiplicado por esa proporción.

## Synopsis

```sql
float l_shannondiversityindex(geometry geom);

ln(label);
```

```tex
\[SHDI= -\sum_{i=1}^{m}\left ( P_{i} ^{\circ}ln P_{i} \right )\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
SELECT -1*SUM(DISTINCT St_Perimeter(col_name geom))*100/
        (SELECT SUM(St_Perimeter(col_name geom)) FROM table_name)*ln(SUM(DISTINCT St_Perimeter(col_name geom))*100/
        (SELECT SUM(St_Perimeter(col_name geom)) FROM table_name)), 
FROM table_name;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
