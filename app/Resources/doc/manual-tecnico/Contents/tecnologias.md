# Tecnologías utilizadas

Todo el software utilizado para creación del SIIG/eTAB es software libre. 

## Gestor de base de datos
PostgreSQL, versión utilizada es la 9.2
Para almacenar la información obtenida de los diferentes orígenes de datos se enfrentaba ante el problema que no se puede determinar la estructura de los datos, serán diferentes para cada origen en cantidad y tipo de campos, por lo cual se eligió el tipo especial de datos HStore perteneciente a PostgreSQL para almacenar esos datos.

## Librería Contrib de PostgreSQL
Para utilizar el tipo de datos HStore es necesario instalar el paquete contrib de postgresql

## Servidor Web
Se ha realizado sobre Apache versión 2.2

## Framework de desarrollo/Servidor
El lenguaje que se ha utilizado es PHP con Symfony versión 2.4

## Framework JavaScript
[jQuery](http://jquery.com/) versión 1.8.3 junto a [jQuery UI](http://jqueryui.com/)

## Framework para interfaces de usuario
[Bootstrap](http://twitter.github.com/bootstrap/) es un framework que hace HTML, CSS y Javascript simple y flexible para componentes e interacciones de interfaz de usuarios populares.

## Librería para gráficos
[D3](http://d3js.org/) es una biblioteca de JavaScript para manipular documentos basados en datos. D3 ayuda dar vida a los datos usando HTML, SVG y CSS. D3 enfatiza los estándares web ofreciendo todas las capacidades de los navegadores modernos sin ligarse a una estructura propietaria.

## Mensajería
La carga de datos se hace con la librería [RabbitMQ](http://www.rabbitmq.com/)