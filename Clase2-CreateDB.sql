

--CREATE DATABASE

/*
	Comentario
	De multiples
	Lineas.
*/

CREATE DATABASE MiPrimeraBase;
GO

USE MiPrimeraBase;
GO

-- CREATE TABLE

CREATE TABLE Productos(
	ProductoID INT PRIMARY KEY,
	Nombre NVARCHAR(50) NOT NULL,
	Precio DECIMAL(10, 2) NOT NULL,
	Stock INT DEFAULT 0
);

--ALTER TABLE

ALTER TABLE Productos
ADD Categoria NVARCHAR(50);

--DROP COLUMN

ALTER TABLE Productos
DROP COLUMN Categoria;

-- DROP TABLE

DROP TABLE Productos;

--Ejercicio: Crear una tabla Clientes, asignar los campos ClienteID, Nombre, Email, FechaRegistro.
--Modificar la tabla agregar la columna Telefono, cambiar el tipo de dato de Email para que acepte mas caracteres.
--Eliminar la tablaa , usando drop table.

