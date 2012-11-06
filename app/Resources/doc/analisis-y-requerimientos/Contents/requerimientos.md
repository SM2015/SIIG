# Requerimientos

## Perfiles de usuario

Se ha identificado los siguientes perfiles de usuario

| Nombre              | Conocimiento deseado |Responsabilidades                           |
|---------------------|----------------------|--------------------------------------------|
| Administrador       | Adminsitración sistemas informáticos | Gestión de usuarios y catálogos             |
| Técnico - datos     | Bases de datos, lenguaje SQL | Creación/configuración de las conexiones y orígenes de datos; gestión de los catálogos responsable y fuente de datos|
| Técnico - indicador | Estadísticos         |Gestión de la ficha técnica del indicador, así como de las variables asociadas a la fórmula del indicador |
| usuario - tablero   | Estadísticos         |Interpretación de resultados de indicadores  |

Los siguientes requerimientos describen la funcionalidad que ofrecerá el sistema.

##Categoría: Captura de datos
|REF        | Descripción                                             |
|-----------|---------------------------------------------------------|
|REQCD001   | Lectura de bases de datos                               |
|REQCD002   | Permitir leer de varios motores de bases de datos       |
|REQCD003   | Cargar datos desde archivos, hojas de cálculo (Excel y OpenOffice) y archivos de texto csv                                                                   |
|REQCD004   | Permitir fusionar desde diferentes orígenes de datos    |
|REQCD005   | Configurar los campos al leer de los orígenes de datos  |

##Categoría: Creación de fórmula
|REF        | Descripción                                             |
|-----------|---------------------------------------------------------|
|REQCF001   | Registro y especificación de las variables a utilizar   |
|REQCF002   | Ingreso de la fórmula y carecterísticas del indicador   |

##Categoría: Tablero de indicadores
|REF        | Descripción                                             |
|-----------|---------------------------------------------------------|
|REQTI001   | Creación de representaciones gráficas de los indicadores|
|REQTI002   | Que se generen alertas de los indicadores               |
|REQTI003   | Capacidad para agregar/manejar nuevos indicadores       |
|REQTI004   | Búsquedas por cada variable involucrada en cada indicador        |
|REQTI005   | Tablero personalizable para cada usuario                |

##Categoría: Generales
|REF        | Descripción                                             |
|-----------|---------------------------------------------------------|
|REQGE001   | Creación de interfaces para la gestión de los catálogos |
|REQGE002   | Creación de servicios web para proporcionar información a sistemas regionales |