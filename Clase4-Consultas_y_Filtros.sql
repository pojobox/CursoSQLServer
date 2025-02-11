

--SELECT * From Productos
SELECT * FROM Productos;

--SELECT Columna FROM Productos

SELECT Nombre FROM Productos;

--WHERE

SELECT * FROM Productos WHERE Precio > 3000;

-- LIKE

SELECT * FROM Productos WHERE Nombre LIKE '%Laptop%';


-- BETWEEN

SELECT * FROM Productos WHERE Precio BETWEEN 3000 AND 7000;

-- ORDER BY
SELECT * FROM Productos ORDER BY Precio DESC;

--TOP 
SELECT TOP (3) * FROM Productos ORDER BY Precio DESC;

--Ejercicio
--1: Crear la tabla Clientes
--2: Insertar datos de prueba(recuerden leer primero todos los pasos antes de empezar para saber que datos deben insertar).
--3:Clausulas
--A) Usar SELECT para traer el campo Nombre de la tabla Clientes.
--B) Usar WHERE para crear la condición que traiga solamente el nombre que empiece con A (Pista pueden usar %).
--C) Usar ORDER BY con la tabla Productos para ordenar los precios de mayor a menor.
--D) Usar TOP para traer los 5 primeros datos de la tabla productos que cumplan con la clausula Precio >= 3500.
--4:Usar ALTER TABLE para:
--A) Agregar una nueva columna a elección a la tabla Clientes.
--B) Modificar el tipo de datos de una columna de la tabla Clientes a elección.
--C) Eliminar una columna de la tabla Clientes a elección.