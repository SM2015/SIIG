# Tablero de indicadores
El objetivo del trablero es proveer una herramienta para el análisis de los datos del indicador de manera dinámica y que el usuario pueda interactuar para mostrar los datos de la forma que más le sea útil.

El tablero se divide en las siguientes áreas:
1. Listado de indicadores agrupados por clasificación técnica.
2. Filtros aplicados.
3. Opciones que se pueden aplicar al indicador: Ordenar y tipo de gráfico.
4. Área de gráfico.
5. Descripción de rangos de alertas.
6. Opciones de la dimensión: Ordenar, filtrar, cambiar dimensión.

![Tablero de indicadores](tablero.png)

## Listado de indicadores
Los grupos mostrados son de acuerdo a las clasificaciones técnicas existentes, para abrir un grupo se debe dar clic en el nombre y se mostrarán todos los indicadores pertenecientes. Para seleccionar un indicador se debe dar clic sobre este y se cargará la información de este.

## Área de gráfico
El gráfico puede ser de cuatro tipos: líneas, circular, mapa o de columnas, el gráfico es interactivo y dinámico, al dar clic en algún elemento de este se creará un filtro con el valor seleccionado y se mostrará un gráfico con la siguiente dimensión disponible. Ej.: Si se tiene el gráfico con los valores para los años 2010 y 2011, podemos dar clic en el elemento del gráfico que representa 2011 para poder ver los datos filtrados por el año 2011 y se mostrará otro gráfico por ejemplo por género.

## Filtros aplicados
Cada vez que se dé clic sobre un elemento del gráfico se creará un filtro con el valor seleccionado, podemos aplicar filtros de acuerdo a la cantidad de variables disponibles para el indicador, además se puede regresar y quitar un filtro dando clic en el nivel deseado

## Descripción de rangos de alertas
Si se han definidos rangos de alertas para el indicador se mostrará el cuadro con el detalle de estos rangos: límite inferior, límite superior, color del rango y un comentario explicativo.
Cada elemento del gráfico se mostrará con el color del rango al cual pertenece, si no existen rangos de alertas se usarán colores aleatoreos para mostrar el gráfico.

## Opciones del indicador

![Opciones del indicador](opciones_indicador.png)

Podemos elegir el tipo de gráfico: Columnas, líneas, mapa y circular. El usuario podrá elegir el gráfico que represente mejor los datos, cada uno de estos gráficos es interactivo.
En el caso de que la variable sea de tipo geográfica y exista un mapa asociado a ella, se dispondrá de este tipo
de gráfico, para acercar el mapa se usará clic derecho de igual manera clic derecho sobre el mismo elemento
para alejar, si se da clic sobre otro elemento cuando el mapa tiene un acercamiento se pasará ese elemento al centro.

![Gráfico circular](region_pastel.png)
![Gráfico de columnas](region_columnas.png)
![Gráfico de líneas](region_lineas.png)
![Gráfico de mapa](grafico_mapa.png)

Ordenar por valor del indicador, con esta opciones podemos ordenar los elementos del gráfico tomando el valor del indicador como parámetro de ordenamiento.

## Opciones de dimensión
![Opciones de dimensión](opciones_dimension.png)

Cambiar dimensión: Podemos elegir la dimensión/variable que queremos graficar.
Ordenar: Ordena según el valor nombre de la dimensión/variable, nos será de mucha utilidad por ejemplo en el caso de que la variable sea año. En otras dimensiones solo hará un ordenamiento alfabético por ejemplo por nombre de municipio.

Filtrar: Podemos realizar el filtrado de los elementos que se muestran en el gráfico de dos formas

1. Todos los elementos que se muestran en el gráfico estarán disponibles como listado para poder seleccionar los que deseemos mostrar en el gráfico.
2. Filtrar por posición, elegimos que posiciones se mostrarán, por ejemplo los primeros 5 elementos, los últimos 10, desde el tercero al 7, etc.

Podemos combinar las diferentes opciones para adecuar el gráfico. Por ejemplo: Si queremos mostrar los 5 elementos con mayor índice, ordenamos el gráfico por indicador y aplicamos un filtro con límite superior 5


# Cubos OLAP

El objetivo de los Cubos OLAP es proveer una herramienta para el análisis de los datos del indicador de forma dinámica y que el usuario pueda seleccionar la combinacion de datos que le resulte mas efectiva para analizar la informacion disponible.

El tablero de cubos OLAP se divide en las siguientes áreas:

1. Menu de indicadores/cubos disponibles en el sistema.

2. Dimensiones disponibles para el indicador seleccionado.

3. Medidas disponibles para el indicador seleccionado.

4. Menu de funciones de manipulacion de datos 

![Interfaz de cubos OLAP](cubos_olap.png)

