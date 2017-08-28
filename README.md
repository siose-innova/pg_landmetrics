# pg_landmetrics
## Tabla de contenidos
- [Descripción](#descripcion)
- [Métricas de paisaje](#metricas-de-paisaje)


## Descripción

**pg_landmetrics** es una extensión de Postgres/PostGIS que permite calcular métricas de paisaje de [FRAGSTATS](http://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf), tanto en vectorial como en ráster. 



## Métricas de paisaje
La lista de métricas actualmente disponibles en pg_landmetrics es la siguiente:

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



### Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerrequisitos

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

### Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

### Deployment

Add additional notes about how to deploy this on a live system

### Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

### Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

### Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

### Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

### Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc

