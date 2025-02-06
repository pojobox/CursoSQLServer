-- CREATE DATABASE

CREATE DATABASE TiendaDB;
GO

-- USAR DB
USE TiendaDB;
GO

-- CREATE TABLE

CREATE TABLE Productos
(
	ProductoID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre NVARCHAR(100) NOT NULL,
	Precio DECIMAL(10,2) NOT NULL,
	Stock INT NOT NULL DEFAULT 0
);



--INSERT INTO

INSERT INTO Productos (Nombre, Precio, Stock)
VALUES
(
	'Laptop',
	1500.00,
	10
);

-- UPDATE Productos

UPDATE Productos SET Nombre = 'Desktop pc'
where Nombre = 'Laptop';

-- DELETE Productos

DELETE FROM Productos
WHERE ProductoID = 4;

-- TRUNCATE TABLE

TRUNCATE TABLE Productos;

/*
Ejercicio: Crear una tabla Clientes con los campos: Nombre, Apellido, Telefono, Email,Direccion(Pueden elegir los tipos de datos y tamaños). A continuación insertar 10 datos a elección.
Updatear el registro que tenga el id 1 y cambiarle algún valor que ustedes quieran,
Eliminar el registro que tenga el id 5 y por ultimo limpiar la tabla con truncate.  para verificar que el truncate funciono pueden insertar un nuevo dato y verificar que se reiniciaron los ID.
*/