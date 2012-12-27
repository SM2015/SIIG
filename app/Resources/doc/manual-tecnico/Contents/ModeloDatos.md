## 1. Tabla Alerta

<table border="1">
  <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">alerta</td>
    <td align="left">codigo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">alerta</td>
    <td align="left">color</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">alerta</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  </table>

## 2. Tabla Campo

<table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">descripcion</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">descripcion</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">id_origen_datos</td>
    <td align="left">int8</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">id_origen_datos</td>
    <td align="left">int8</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">id_significado_campo</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">id_significado_campo</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">id_tipo_campo</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">id_tipo_campo</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">nombre</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">campo</td>
    <td align="left">nombre</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr></table>
  
## 3. Tabla Clasificacion_Nivel

    <table><tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_nivel</td>
    <td align="left">codigo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_nivel</td>
    <td align="left">comentario</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_nivel</td>
    <td align="left">descripcion</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_nivel</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  </table>
  
## 4. Tabla Clasificacion Privacidad

<table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_privacidad</td>
    <td align="left">codigo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_privacidad</td>
    <td align="left">comentario</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_privacidad</td>
    <td align="left">descripcion</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_privacidad</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  </table>
  
## 5. Tabla Clasificacion_Tecnica
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_tecnica</td>
    <td align="left">codigo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_tecnica</td>
    <td align="left">comentario</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_tecnica</td>
    <td align="left">descripcion</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_tecnica</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>  </table>
  
## 6. Tabla Clasificacion_Uso
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_uso</td>
    <td align="left">codigo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_uso</td>
    <td align="left">comentario</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_uso</td>
    <td align="left">descripcion</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">clasificacion_uso</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr> </table>
  
## 7. Tabla Conexion
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">clave</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">clave</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">comentario</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">comentario</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">id_motor</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">id_motor</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">instancia</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">instancia</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">ip</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">ip</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">nombre_base_datos</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">nombre_base_datos</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">nombre_conexion</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">nombre_conexion</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">puerto</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">puerto</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">usuario</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">conexion</td>
    <td align="left">usuario</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
   </table>
  
## 8. Tabla Ficha_Tenica
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">campos_indicador</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">campos_indicador</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">concepto</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">concepto</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">confiabilidad</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">confiabilidad</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">definicion_operativa</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">definicion_operativa</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">formula</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">formula</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_clasificacion_nivel</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_clasificacion_nivel</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_clasificacion_privacidad</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_clasificacion_privacidad</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_clasificacion_tecnica</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_clasificacion_tecnica</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_clasificacion_uso</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_clasificacion_uso</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_periodo</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_periodo</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_responsable_indicador</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">id_responsable_indicador</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">nombre</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">nombre</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">objetivo</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">objetivo</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">observacion</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">observacion</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">tema</td>
    <td align="left">text</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">tema</td>
    <td align="left">text</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">ultima_lectura</td>
    <td align="left">timestamp</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">ultima_lectura</td>
    <td align="left">timestamp</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">unidad_medida</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">unidad_medida</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">updated_at</td>
    <td align="left">timestamp</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">updated_at</td>
    <td align="left">timestamp</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">uso</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica</td>
    <td align="left">uso</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr></table>
  
## 9. Tabla Ficha_Tecnica_Campo
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_campo</td>
    <td align="left">id_campo</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_campo</td>
    <td align="left">id_campo</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_campo</td>
    <td align="left">id_ficha_tecnica</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_campo</td>
    <td align="left">id_ficha_tecnica</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr></table>
  
## 10. Tabla Ficha_Tecnica_Periodicidad  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_periodicidad</td>
    <td align="left">id_ficha_tecnica</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_periodicidad</td>
    <td align="left">id_ficha_tecnica</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_periodicidad</td>
    <td align="left">id_periodicidad</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_periodicidad</td>
    <td align="left">id_periodicidad</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr></table>
  
## 11. Tabla Ficha_Tecnica_Presentacion
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_presentacion</td>
    <td align="left">id_ficha_tecnica</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_presentacion</td>
    <td align="left">id_ficha_tecnica</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_presentacion</td>
    <td align="left">id_presentacion</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_presentacion</td>
    <td align="left">id_presentacion</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr></table>
  
## 12. Tabla Ficha_Tecnica_Variable_dato
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_variable_dato</td>
    <td align="left">id_ficha_tecnica</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_variable_dato</td>
    <td align="left">id_ficha_tecnica</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_variable_dato</td>
    <td align="left">id_variable_dato</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">ficha_tecnica_variable_dato</td>
    <td align="left">id_variable_dato</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr></table>
  
## 13. Tabla Fila_Origen_Dato
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">fila_origen_dato</td>
    <td align="left">datos</td>
    <td align="left">hstore</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">fila_origen_dato</td>
    <td align="left">datos</td>
    <td align="left">hstore</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fila_origen_dato</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">fila_origen_dato</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fila_origen_dato</td>
    <td align="left">id_origen_dato</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">fila_origen_dato</td>
    <td align="left">id_origen_dato</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  </table>
  
## 14. Tabla Fos_User_Group
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_group</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_group</td>
    <td align="left">name</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_group</td>
    <td align="left">roles</td>
    <td align="left">text</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr></table>
  
## 15. Tabla Fos_User_User
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">biography</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">confirmation_token</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">created_at</td>
    <td align="left">timestamp</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">credentials_expire_at</td>
    <td align="left">timestamp</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">credentials_expired</td>
    <td align="left">bool</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">date_of_birth</td>
    <td align="left">timestamp</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">email</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">email_canonical</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">enabled</td>
    <td align="left">bool</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">expired</td>
    <td align="left">bool</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">expires_at</td>
    <td align="left">timestamp</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">facebook_data</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">facebook_name</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">facebook_uid</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">firstname</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">gender</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">gplus_data</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">gplus_name</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">gplus_uid</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">last_login</td>
    <td align="left">timestamp</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">lastname</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">locale</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">locked</td>
    <td align="left">bool</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">password</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">password_requested_at</td>
    <td align="left">timestamp</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">phone</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">roles</td>
    <td align="left">text</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">salt</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">timezone</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">token</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">twitter_data</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">twitter_name</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">twitter_uid</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">two_step_code</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">updated_at</td>
    <td align="left">timestamp</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">username</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">username_canonical</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user</td>
    <td align="left">website</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr></table>
  
## 15. Tabla Fos_User_User_Group
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user_group</td>
    <td align="left">group_id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user_group</td>
    <td align="left">group_id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user_group</td>
    <td align="left">user_id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">fos_user_user_group</td>
    <td align="left">user_id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr></table>
  
## 16. Tabla Fuente_Dato
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">fuente_dato</td>
    <td align="left">cargo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fuente_dato</td>
    <td align="left">contacto</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fuente_dato</td>
    <td align="left">correo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fuente_dato</td>
    <td align="left">establecimiento</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fuente_dato</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fuente_dato</td>
    <td align="left">telefono</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr></table>
  
## 17. Tabla Fusion_Origenes_Datos
  
  <table>
    <tr>
    <th align="center">tabla</th>
    <th align="center">columna</th>
    <th align="center">tipo</th>
    <th align="center">esnulo</th>
    <th align="center">tipollave</th>
  </tr>
  <tr valign="top">
    <td align="left">fusion_origenes_datos</td>
    <td align="left">campos</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">fusion_origenes_datos</td>
    <td align="left">campos</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fusion_origenes_datos</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">fusion_origenes_datos</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fusion_origenes_datos</td>
    <td align="left">id_origen_datos</td>
    <td align="left">int8</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">fusion_origenes_datos</td>
    <td align="left">id_origen_datos</td>
    <td align="left">int8</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">fusion_origenes_datos</td>
    <td align="left">id_origen_datos_fusionado</td>
    <td align="left">int8</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">fusion_origenes_datos</td>
    <td align="left">id_origen_datos_fusionado</td>
    <td align="left">int8</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador1</td>
    <td align="left">anio</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador1</td>
    <td align="left">area</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador1</td>
    <td align="left">calculo</td>
    <td align="left">numeric</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador1</td>
    <td align="left">departamento</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador1</td>
    <td align="left">edad</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador1</td>
    <td align="left">genero</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador1</td>
    <td align="left">id_fila</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador1</td>
    <td align="left">mes</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador1</td>
    <td align="left">municipio</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador1</td>
    <td align="left">region</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador3</td>
    <td align="left">anio</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador3</td>
    <td align="left">area</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador3</td>
    <td align="left">calculo</td>
    <td align="left">numeric</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador3</td>
    <td align="left">departamento</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador3</td>
    <td align="left">edad</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador3</td>
    <td align="left">establecimiento</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador3</td>
    <td align="left">id_fila</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador3</td>
    <td align="left">mes</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador3</td>
    <td align="left">municipio</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador3</td>
    <td align="left">region</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador3</td>
    <td align="left">sibasis</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador4</td>
    <td align="left">anio</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador4</td>
    <td align="left">area</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador4</td>
    <td align="left">calculo</td>
    <td align="left">numeric</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador4</td>
    <td align="left">departamento</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador4</td>
    <td align="left">edad</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador4</td>
    <td align="left">establecimiento</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador4</td>
    <td align="left">id_fila</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador4</td>
    <td align="left">mes</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador4</td>
    <td align="left">municipio</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador4</td>
    <td align="left">region</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador4</td>
    <td align="left">sibasis</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador5</td>
    <td align="left">anio</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador5</td>
    <td align="left">calculo</td>
    <td align="left">numeric</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador5</td>
    <td align="left">establecimiento</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador5</td>
    <td align="left">id_fila</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador5</td>
    <td align="left">mes</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador5</td>
    <td align="left">region</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador5</td>
    <td align="left">sibasis</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador6</td>
    <td align="left">anio</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador6</td>
    <td align="left">calculo</td>
    <td align="left">numeric</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador6</td>
    <td align="left">establecimiento</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador6</td>
    <td align="left">id_fila</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador6</td>
    <td align="left">mes</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador6</td>
    <td align="left">region</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador6</td>
    <td align="left">sibasis</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador7</td>
    <td align="left">anio</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador7</td>
    <td align="left">area</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador7</td>
    <td align="left">calculo</td>
    <td align="left">numeric</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador7</td>
    <td align="left">departamento</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador7</td>
    <td align="left">edad</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador7</td>
    <td align="left">establecimiento</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador7</td>
    <td align="left">id_fila</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador7</td>
    <td align="left">mes</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador7</td>
    <td align="left">municipio</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador7</td>
    <td align="left">region</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador7</td>
    <td align="left">sibasis</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">comentario</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">comentario</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">id_color_alerta</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">id_color_alerta</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">id_indicador</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">id_indicador</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">limite_inferior</td>
    <td align="left">float8</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">limite_inferior</td>
    <td align="left">float8</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">limite_superior</td>
    <td align="left">float8</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">indicador_alertas</td>
    <td align="left">limite_superior</td>
    <td align="left">float8</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">motor_bd</td>
    <td align="left">codigo</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">motor_bd</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">motor_bd</td>
    <td align="left">nombre</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">archivo_nombre</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">archivo_nombre</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">campos_fusionados</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">campos_fusionados</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">descripcion</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">descripcion</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">es_catalogo</td>
    <td align="left">bool</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">es_catalogo</td>
    <td align="left">bool</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">es_fusionado</td>
    <td align="left">bool</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">es_fusionado</td>
    <td align="left">bool</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">id</td>
    <td align="left">int8</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">id</td>
    <td align="left">int8</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">id_conexion</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">id_conexion</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">nombre</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">nombre</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">nombre_catalogo</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">nombre_catalogo</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">sentencia_sql</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos</td>
    <td align="left">sentencia_sql</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos_fusiones</td>
    <td align="left">id_origen_dato</td>
    <td align="left">int8</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos_fusiones</td>
    <td align="left">id_origen_dato</td>
    <td align="left">int8</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos_fusiones</td>
    <td align="left">id_origen_dato_fusionado</td>
    <td align="left">int8</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">origen_datos_fusiones</td>
    <td align="left">id_origen_dato_fusionado</td>
    <td align="left">int8</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">periodos</td>
    <td align="left">codigo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">periodos</td>
    <td align="left">descripcion</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">periodos</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">periodos</td>
    <td align="left">sentencia</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">presentacion</td>
    <td align="left">codigo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">presentacion</td>
    <td align="left">descripcion</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">presentacion</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_dato</td>
    <td align="left">cargo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_dato</td>
    <td align="left">contacto</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_dato</td>
    <td align="left">correo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_dato</td>
    <td align="left">establecimiento</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_dato</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_dato</td>
    <td align="left">telefono</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_indicador</td>
    <td align="left">cargo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_indicador</td>
    <td align="left">contacto</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_indicador</td>
    <td align="left">correo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_indicador</td>
    <td align="left">establecimiento</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_indicador</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">responsable_indicador</td>
    <td align="left">telefono</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">significado_campo</td>
    <td align="left">catalogo</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">significado_campo</td>
    <td align="left">codigo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">significado_campo</td>
    <td align="left">descripcion</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">significado_campo</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">significado_campo</td>
    <td align="left">nombre_mapa</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">significado_campo</td>
    <td align="left">uso_en_catalogo</td>
    <td align="left">bool</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">tipo_campo</td>
    <td align="left">codigo</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">tipo_campo</td>
    <td align="left">descripcion</td>
    <td align="left">varchar</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">tipo_campo</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">usuario_indicadores_favoritos</td>
    <td align="left">id_indicador</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">usuario_indicadores_favoritos</td>
    <td align="left">id_indicador</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">usuario_indicadores_favoritos</td>
    <td align="left">id_usuario</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">usuario_indicadores_favoritos</td>
    <td align="left">id_usuario</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">comentario</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">comentario</td>
    <td align="left">text</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">confiabilidad</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">confiabilidad</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">es_poblacion</td>
    <td align="left">bool</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">es_poblacion</td>
    <td align="left">bool</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">id</td>
    <td align="left">int4</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">id_fuente_dato</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">id_fuente_dato</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">id_origen_datos</td>
    <td align="left">int8</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">id_origen_datos</td>
    <td align="left">int8</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">id_responsable_dato</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">id_responsable_dato</td>
    <td align="left">int4</td>
    <td align="left">f</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">iniciales</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">iniciales</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">nombre</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">f</td>
  </tr>
  <tr valign="top">
    <td align="left">variable_dato</td>
    <td align="left">nombre</td>
    <td align="left">varchar</td>
    <td align="left">t</td>
    <td align="left">p</td>
  </tr>
</table>
