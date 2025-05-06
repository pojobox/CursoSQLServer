# Curso de SQL Server de Básico a Avanzado

¡Bienvenidos al repositorio oficial del Curso de SQL Server Básico  🎉 Aca vas a encontrar el código fuente y los ejemplos prácticos utilizados a lo largo del curso. Este repositorio está diseñado para complementar los videos de YouTube y facilitar tu aprendizaje de SQL desde cero

## 🚀 ¿Qué vas a encontrar en este repositorio?

### 📚 Contenido del Curso
El curso está estructurado en clases, cada una diseñada para cubrir conceptos clave de SQL de forma progresiva.

### Modulo Básico.

### 🗂 Introducción
- **Clase 01: Introducción a SQL Server e Instalación del Motor de bases de datos.**
  - Introducción a SQL Server.
  - Que es una DB.
  - Tipos de motores que soportan el lenguaje SQL.
  - Descarga e instalación de Microsoft SQL Server 2022 Express Edition.
  - Descarga e instalación de Sql management studio.

### 🗂 Clases con Código Incluido

- **Clase 02: Introducción a la gestion de bases de datos, tipos de datos, operaciónes básicas.**
  - Explicación de tipos de datos.
  - commandos básicos.
  - Restricciónes.
  - Creación de primera DB.
  - Creación de primera tabla.
  - Alteración de table con commando ALTER.
  - Eliminación de campos y tablas.

  -Ejercicio: Crear una tabla Clientes con los campos: ClienteID, Nombre, Email, FechaRegistro.
  - Modificar la tabla, agregar la columna Telefono, cambiar el tipo de dato de Email para que 
  -acepte mas caracteres.
  -Eliminar la tabla, usando drop table.

- **Clase 03: Operaciónes con datos (Crud Básico).**
  - Cómo insertar registros en una tabla con INSERT INTO.
  - Modificar datos existentes usando UPDATE.
  - Eliminar registros de forma controlada con DELETE.
  - Vaciar completamente una tabla con TRUNCATE TABLE.

- Ejercicio: Crear una tabla Clientes con los campos: Nombre, Apellido, Telefono, Email,Direccion(Pueden elegir los tipos de datos y tamaños).
  - A continuación insertar 10 datos a elección.
  - Updatear el registro que tenga el id 1 y cambiarle algún valor que ustedes quieran.
  - Eliminar el registro que tenga el id 5 y por ultimo limpiar la tabla con truncate.
  - para verificar que el truncate funciono pueden insertar un nuevo dato y verificar que se reiniciaron los ID.

- **Clase 04: Consultas_y_Filtros.**
  - SELECT - Obtener información de una tabla.
  - WHERE - Aplicar filtros con condiciones.
  - ORDER BY - Ordenar los resultados (ascendente o descendente).
  - TOP - Limitar la cantidad de registros devueltos.

- Ejercicio:
  - 1: Crear la tabla Clientes
  - 2: Insertar datos de prueba(recuerden leer primero todos los pasos antes de empezar para saber que datos deben insertar).
  - 3: Clausulas:
  - A) Usar SELECT para traer el campo Nombre de la tabla Clientes.
  - B) Usar WHERE para crear la condición que traiga solamente el nombre que empiece con A (Pista pueden usar %).
  - C) Usar ORDER BY con la tabla Productos para ordenar los precios de mayor a menor.
  - D) Usar TOP para traer los 5 primeros datos de la tabla productos que cumplan con la clausula Precio >= 3500.
  - 4: Usar ALTER TABLE para:
  - A) Agregar una nueva columna a elección a la tabla Clientes.
  - B) Modificar el tipo de datos de una columna de la tabla Clientes a elección.
  - C) Eliminar una columna de la tabla Clientes a elección.

- **Quiero felicitarte porque acabas de terminar el primer módulo de este curso de SQL server, seguí practicando y jugando con lo aprendido y yo te veo en el próximo módulo ;-).**

### BIENVENIDOS AL MODULO INTERMEDIO!!!

- **Clase 01: Tipos de Relaciónes.**
  - Claves Primarias y Foráneas → Qué son, para qué sirven y cómo se crean en SQL Server.
  - Tipos de Relaciones → Uno a uno (1:1), uno a muchos (1:N) y muchos a muchos (M:N), con ejemplos bien claros.
  - Ejemplo Práctico → Vamos a crear tablas con relaciones y ver cómo conectar los datos con FOREIGN KEY.

- **Clase 02: Consultas avanzadas (JOINS).**
  - INNER JOIN → Une registros de ambas tablas solo cuando hay coincidencia.
  - LEFT JOIN → Devuelve todos los registros de la tabla izquierda, aunque no haya coincidencias en la derecha.
  - RIGHT JOIN → Devuelve todos los registros de la tabla derecha, aunque no haya coincidencias en la izquierda.
  - FULL JOIN → Devuelve todos los registros de ambas tablas, con NULL donde no haya coincidencias.

- **Clase 03: Consultas avanzadas 2 (SubQueries).**
  - Subconsulta en la cláusula WHERE: Filtrar registros con condiciones avanzadas.
  - Subconsulta en la cláusula SELECT: Calcular valores adicionales en una consulta.

- **Clase 04: Consultas avanzadas 3 (Funciones de agregado).**
  - COUNT(): Cuenta el número total de registros en una tabla.
  - SUM(): Calcula la suma de los valores en una columna numérica.
  - AVG(): Obtiene el promedio de los valores en una columna.
  - MIN() y MAX(): Encuentran el valor mínimo y máximo en un conjunto de datos.
  - Ejemplos practicos:
  - Contar la cantidad de pedidos en la tabla Pedidos.
  - Calcular el total de ventas sumando los precios de los productos.
  - Obtener el precio promedio de los productos en stock.
  - Encontrar el precio más bajo y más alto de una lista de productos.
 
- **Clase 05: Consultas avanzadas 4 (Agrupamiento de Datos).**
  - GROUP BY: Agrupa registros con valores idénticos en columnas seleccionadas.
  - HAVING: Filtra grupos de datos después de aplicar GROUP BY, similar a WHERE.
  - Funciones de agregado: COUNT(), SUM(), y más en combinación con GROUP BY.
  - Consultas avanzadas: Uso de INNER JOIN para combinar información de múltiples tablas.
  - Ejemplos prácticos con código SQL:
  - Contar la cantidad de pedidos por cliente.
  - Filtrar clientes que hayan realizado más de 2 pedidos.
  - Obtener el total gastado por cada cliente en sus pedidos.
  - Crear un reporte avanzado con clientes, pedidos y productos.
 
- **Clase 06: Índices en SQL**
  - ¿Qué son los índices en SQL y por qué son importantes?.
  - Tipos de índices: Primary Key, Unique, Normal, Compuesto y FullText.
  - Crear y eliminar índices con CREATE INDEX y DROP INDEX.
  - Cómo los índices afectan el rendimiento de las consultas.
  - Uso de SHOWPLAN_ALL para analizar el plan de ejecución.
  - Comparación entre Table Scan ❌ vs. Index Seek ✅.
  - Ejemplos prácticos:
  - Ejecutamos una consulta SIN índice y analizamos el plan de ejecución.
  - Creamos un índice y comparamos los resultados.
  - Explicamos por qué Index Seek es mucho más eficiente.

- **Clase 07: Vistas en SQL - Parte 1**
  - Parte Teórica:
  - ¿Qué es una vista en SQL?
  - Ventajas y desventajas de usar vistas
  - Cuándo conviene usarlas
  - Parte Práctica:
  - Crear una vista simple
  - Crear vistas con JOIN
  - Usar funciones de agregado (SUM, COUNT, etc.) en vistas
  - Modificar y eliminar vistas
 
- **Clase 08: Vistas en SQL - Parte 2**
  - Cómo ocultar información sensible con vistas
  - Crear reportes predefinidos con funciones agregadas (SUM, MONTH, YEAR)
  - Simplificar consultas complejas con JOIN reutilizando vistas
 
- **Clase 09: Funciones en SQL Parte 1**
  - Cómo calcular valores con funciones como ABS, ROUND, POWER, SQRT.
  - Cómo manipular texto usando UPPER, LOWER, SUBSTRING, REPLACE.
  - Cómo trabajar con fechas usando GETDATE, YEAR, MONTH, DATEDIFF, etc.
  - Parte Práctica Incluida:
  - Vamos a ver ejemplos reales directamente en SQL Server, donde aplicamos estas funciones en consultas reales.
 
- **Clase 10: Funciones en SQL Parte 2**
  - Qué es una función definida por el usuario
  - Cuáles son los tipos de funciones en SQL Server (Escalares, Table-Valued)
  - Cómo crear y utilizar funciones escalares
  - Cómo crear funciones que devuelven tablas
  - Cómo eliminar funciones personalizadas
  - Casos prácticos con funciones de nombre completo, cálculo de IVA, y consultas por ID
 
- **Clase 11: Ejercicio Integrador Completo**
  - Relaciones entre tablas (Claves primarias y foráneas)
  - Tipos de JOIN: INNER JOIN, LEFT JOIN, etc.
  - Subconsultas (Subqueries)
  - Funciones de agregado: SUM, AVG, COUNT, MAX, MIN
  - Agrupaciones con GROUP BY y filtros con HAVING
  - Creación y uso de vistas
  - Funciones definidas por el usuario
  - Creación de índices para optimización

 - **Proyecto: Base de datos para un sistema de ventas con clientes, empleados, productos y facturación.**

 - **Quiero felicitarte nuevamente porque acabas de terminar el módulo intermedio, seguí practicando y jugando con lo aprendido y yo te veo en el próximo módulo ;-).**


*(A medida que avancemos en el curso, se añadirán más clases con ejemplos y ejercicios prácticos.)*
*Vamos a estar subiendo cada nueva clase los dias Martes por la tarde, No te la pierdas!!*

---

## 📥 Cómo usar este repositorio
1. **Navega por las carpetas de cada clase** para acceder al código correspondiente.
2. **Sigue las instrucciones en los videos** para poner en práctica lo aprendido.
3. **Implementa los ejemplos y ejercicios** directamente en el motor de sql server.

---

## 📹 Curso en YouTube
¡Seguí el curso completo en mi canal de YouTube!  
🔗https://www.youtube.com/watch?v=b3lk4NwH2Mg&list=PLa_oI_dNTkD07_3nRabsDk55wpSJiNsEm

🔔 **¡No olvides suscribirte para no perderte ninguna clase!**

---

## 📧 Contacto
Si tenés dudas o sugerencias:
- Dejanos tu comentario en los videos.  

¡Estaré encantado de ayudarte! 😊

---

### 🌟 ¡Gracias por aprender conmigo!
Espero que este curso sea una guía útil en tu camino para dominar SQL. 💻✨

**Te saluda tu instructor Jonathan!**
