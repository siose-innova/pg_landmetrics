## Patch Area (vectorial)

Descripción: es igual a la suma del área del polígono dividido por 10,000 (para convertir a hectáreas).

Unidades: Hectáreas.

$$
\[AREA= a_{ij}\left ( \frac{1}{10,000} \right )\
$$

#### Sección de SQL

```sql
SELECT St_Area(geom)/10000 FROM table;
```

#### Referencias

Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf
