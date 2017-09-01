# pg_landmetrics
![header example - proyecto SIOSE-INNOVA](https://github.com/andrearosado/pg_landmetrics/blob/master/header.png)

## Tabla de contenidos
- [Descripción](#descripcion)
- [Métricas de paisaje](#metricas-de-paisaje)
- [Para empezar](#para-empezar)
  - [Prerrequisitos](#prerrequisitos)
  - [Instalación](#instalacion)
- [A prueba](#a-prueba)
- [Contribución](#contribución)
- [Licencia](#licencia)


## Descripción
`pg_landmetrics` es una extensión de Postgres/PostGIS que permite calcular métricas de paisaje de [FRAGSTATS](http://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf) (McGarigal, 2015), tanto para datos vectoriales como ráster.

Esta extensión está relacionada con un proyecto de investigación llamado [**SIOSE-INNOVA**](http://siose-innova.es/project/). Este proyecto tiene dos objetivos principales:
* Innovación técnica para la comprobación de tecnologías NoSQL que aporten mejores soluciones en la base de datos
* Aplicación de estas nuevas tecnologías en casos de estudios reales


## Métricas de paisaje
La lista de métricas actualmente disponibles en `pg_landmetrics` es la siguiente:

- **PATCH** - se calcula para cada polígono del paisaje:

| Métrica | Función | Detalles |
| --- | --- | --- |
| `AREA` | p_area(geom) | [Ver ficha](doc/p_area.md) |
| `CORE AREA` | p_corearea(geom) | [Ver ficha](doc/p_corearea.md) |
| `CORE AREA INDEX` | p_coreareaindex(geom) | [Ver ficha](doc/p_coreareaindex.md) |
| `EUCLIDEAN NEAREST NEIGHBOUR DISTANCE` | p_euclideanearestneighbourdistance(geom) | [Ver ficha](doc/p_euclideanearestneighbourdistance.md) |
| `NUMBER CORE AREAS` | p_numcoreareas(geom) | [Ver ficha](doc/p_numcoreareas.md) |
| `PERIMETER` | p_perimeter(geom) | [Ver ficha](doc/p_perimeter.md) |
| `PERIMETER AREA RATIO` | p_perimarearatio(geom) | [Ver ficha](doc/p_perimarearatio.md) |
| `SHAPE INDEX` | p_shape(geom) | [Ver ficha](doc/p_shape.md) |

- **CLASS** - se calcula para cada tipo o categoría de polígono del paisaje:

| Métrica | Función | Detalles |
| --- | --- | --- |
| `CORE AREA PERCENTAGE LANDSCAPE` | c_coreareapercentlandscape(geom) | [Ver ficha](doc/c_coreareapercentlandscape.md) |
| `EDGE DENSITY` | c_edgedensity(geom) | [Ver ficha](doc/c_edgedensity.md) |
| `NUMBER PATCHES` | c_numpatches(geom) | [Ver ficha](doc/c_numpatches.md) |
| `PATCH DENSITY` | c_patchdensity(geom) | [Ver ficha](doc/c_patchdensity.md) |
| `PERCENTAGE LANDSCAPE` | c_percentagelandscape(geom) | [Ver ficha](doc/c_percentagelandscape.md) |
| `TOTAL AREA` | c_totalarea(geom) | [Ver ficha](doc/c_totalarea.md) |
| `TOTAL CORE AREA` | c_totalcorearea(geom) | [Ver ficha](doc/c_totalcorearea.md) |
| `TOTAL EDGE` | c_totaledge(geom) | [Ver ficha](doc/c_totaledge.md) |

- **LANDSCAPE** - se calcula para todo el mosaico de poligonos del paisaje:

| Métrica | Función | Detalles |
| --- | --- | --- |
| `EDGE DENSITY` | l_edgedensity(geom) | [Ver ficha](doc/l_edgedensity.md) |
| `NUMBER PATCHES` | l_numpatches(geom) | [Ver ficha](doc/l_numpatches.md) |
| `PATCH DENSITY` | l_patchdensity(geom) | [Ver ficha](doc/l_patchdensity.md) |
| `PATCH RICHNESS` | l_patchrichness(geom) | [Ver ficha](doc/l_patchrichness.md) |
| `PATCH RICHNESS DENSITY` | l_patchrichnessdensity(geom) | [Ver ficha](doc/l_patchrichnessdensity.md) |
| `SHANNON'S DIVERSITY INDEX` | l_shannondiversityindex(geom) | [Ver ficha](doc/l_shannondiversityindex.md) |
| `SIMPSON'S DIVERSITY INDEX` | l_simpsondiversityindex(geom) | [Ver ficha](doc/l_simpsondiversityindex.md) |
| `TOTAL AREA` | l_totalarea(geom) | [Ver ficha](doc/l_totalarea.md) |
| `TOTAL EDGE` | l_totaledge(geom) | [Ver ficha](doc/l_totaledge.md) |


## Para empezar
Para obtener una copia de este proyecto y tenerlo en funcionamiento en la máquina local, va a ser necesario realizar los siguientes pasos: 

### Prerrequisitos
- PostgreSQL 9.5+
- PostGIS extension
- Git

### Instalación



### A prueba
Para probar alguna de las métricas realizadas en `pg_landmetrics`, solamente será necesario copiar la consulta SQL o función en el interfaz de PgAdmin. 

## Contribución
Para ver detalles sobre el código de conducta y el proceso de envío de solicitudes para la contribución al proyecto, por favor lea el archivo [CONTRIBUTING.md](CONTRIBUTING.md)

## Licencia
Este proyecto está bajo licencia - ver archivo [LICENSE](LICENSE) para más detalles.

