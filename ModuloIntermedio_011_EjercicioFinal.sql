-- Ejercicio final modulo intermedio

/*
	Objetivo: Aplicar de forma autónoma todos los conceptos del modulo intermedio: relaciones,
	consultas, vistas, funciones e indices.
*/
--Realizá cada uno de los siguientes puntos utilizando consultas SQL
	--------------------------------------------------------------------------------------------------------------
/*	
	1) crear y poblar la base de datos ExIntermedio
	--------------------------------------------------------------------------------------------------------------
	Crear las siguientes tablas:

	Clientes

	Empleados

	Productos

	Ventas

	DetallesVenta

	Tip: Podes usar los tipos de datos que ya conocés como: INT , VARCHAR, DATE, DECIMAL,  y aplicar correctamente claves primarias y foraneas.
	--------------------------------------------------------------------------------------------------------------
*/	
	--1) Crear db ExIntermedio
CREATE DATABASE ExIntermedio;
GO

-- 1) Crear las tablas

--Clientes
CREATE TABLE Clientes
(
	ClienteID INT PRIMARY KEY,
	Nombre VARCHAR(100),
	Correo VARCHAR(100)
)

--Empleados
CREATE TABLE Empleados
(
	EmpleadoID INT PRIMARY KEY,
	Nombre VARCHAR(100),
	Puesto VARCHAR(50)
)

--Productos
CREATE TABLE Productos
(
	ProductoID INT PRIMARY KEY,
	Nombre VARCHAR(100),
	Precio DECIMAL(10,2),
	STOCK INT
)

--Ventas
CREATE TABLE Ventas
(
	VentaID INT PRIMARY KEY,
	Fecha DATE,
	ClienteID INT,
	EmpleadoID INT,
	FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
	FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
)

--Detalles de venta
CREATE TABLE DetallesVenta
(
	DetalleID INT PRIMARY KEY,
	VentaID INT,
	ProductoID INT,
	PrecioUnitario DECIMAL(10,2)
	FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
	FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
)
-- modificar tabla para agregar la cantidad
ALTER TABLE DetallesVenta ADD Cantidad INT;
/*
	2)Insertar al menos
	--------------------------------------------------------------------------------------------------------------
	3 clientes

	2 empleados

	5 productos
	
	2 ventas(cada una con al menos 2 productos)
	--------------------------------------------------------------------------------------------------------------
*/
-- 2) Insertar datos

--Clientes
INSERT INTO Clientes VALUES(1,'Ana Torres', 'ana@gmail.com');
INSERT INTO Clientes VALUES(2,'Luis Perez', 'luis@gmail.com');
INSERT INTO Clientes VALUES(3,'Maria Gomez', 'maria@gmail.com');

-- Empleados
INSERT INTO Empleados VALUES(1, 'Carlos Ruiz', 'Vendedor');
INSERT INTO Empleados VALUES(2, 'Laura Diaz', 'Cajera');

-- Productos

INSERT INTO Productos VALUES(1, 'Gaseosa', 1500.00,50);
INSERT INTO Productos VALUES(2, 'Pan', 1000.00,100);
INSERT INTO Productos VALUES(3, 'Leche', 900.00,40);
INSERT INTO Productos VALUES(4, 'Arroz', 700.00,20);
INSERT INTO Productos VALUES(5, 'Azucar', 500.00,60);

--Ventas
INSERT INTO Ventas VALUES(1, '2024-06-12',1,1);
INSERT INTO Ventas VALUES(2, '2024-08-19',2,2);

-- Detalles de venta
INSERT INTO DetallesVenta VALUES(1,1,1,2,1500.00) -- Gaseosa x2
INSERT INTO DetallesVenta VALUES(2,1,3,1,900.00) -- Leche x1
INSERT INTO DetallesVenta VALUES(3,2,2,3,1000.00) -- Pan x3
INSERT INTO DetallesVenta VALUES(4,2,5,2,500.00) -- Azucar x2


/*
	3)  Consultas avanzadas
	--------------------------------------------------------------------------------------------------------------

	A) Mostrar el detalle completo de una venta (cliente,producto, empleado,cantidad,precio unitario, total por item).

	B) Mostrar todos los productos, incluso los que no fueron vendidos(LEFT JOIN).

	C) Mostrar todos los productos cuyo precio es mayor al promedio(subconsulta).

	D) Mostrar el total vendido por cliente(GROUP BY).

	E) Mostrar solo los clientes con mas de una venta(HAVING)

	F) Mostrar:

		Total general vendido,
		Total de productos vendidos,
		Precio promedio de productos
	--------------------------------------------------------------------------------------------------------------
*/

-- A) Detalle completo de una venta
	SELECT v.VentaID, c.Nombre AS Cliente, e.Nombre AS Empleado,
	p.Nombre AS Producto, d.Cantidad, d.PrecioUnitario,
	d.Cantidad * d.PrecioUnitario AS TotalItem
	FROM Ventas v
	JOIN Clientes c ON v.ClienteID = c.ClienteID
	JOIN Empleados e ON v.EmpleadoID = e.EmpleadoID
	JOIN DetallesVenta d ON v.VentaID = d.VentaID
	JOIN Productos p ON d.ProductoID = p.ProductoID
	WHERE v.VentaID = 1;

-- B)Mostrar todos los productos
	SELECT p.Nombre, d.Cantidad
	FROM Productos p
	LEFT JOIN DetallesVenta d ON p.ProductoID = d.ProductoID;

-- C) Mostrar productos con precio mayor al promedio
	SELECT * FROM Productos
	WHERE Precio >(SELECT AVG(Precio) FROM Productos);

-- D) Mostrar el total vendido por cliente
	SELECT c.Nombre,SUM(d.Cantidad * d.PrecioUnitario) AS TotalComprado
	FROM Clientes c
	JOIN Ventas v ON c.ClienteID = v.ClienteID
	JOIN DetallesVenta d ON v.VentaID = d.VentaID
	GROUP BY c.Nombre

-- E) Mostrar los clientes con mas de una venta
	SELECT c.Nombre, COUNT(v.VentaID) AS CantidadVentas
	FROM Clientes c
	JOIN Ventas v ON c.ClienteID = v.ClienteID
	GROUP BY c.Nombre
	HAVING COUNT(v.VentaID) >= 1;

-- F) 
	-- Total vendido
	SELECT SUM(Cantidad * PrecioUnitario) AS TotalVendido FROM DetallesVenta;
	-- Total de productos vendidos
	SELECT SUM(Cantidad) AS TotalProductosVendidos FROM DetallesVenta;
	-- Precio promedio de productos
	SELECT AVG(Precio) AS PrecioPromedio FROM Productos;
/*
	4) Crear una vista
	--------------------------------------------------------------------------------------------------------------
	A) Crear una vista que muestre: Nombre del cliente, empleado, fecha y total de cada venta.
	--------------------------------------------------------------------------------------------------------------
*/
CREATE VIEW VistaVentasResumen AS
SELECT
v.VentaID,
c.Nombre AS Cliente,
e.Nombre AS Empleado,
v.Fecha,
SUM(d.Cantidad * d.PrecioUnitario) AS TotalVenta
FROM Ventas v
JOIN Clientes c ON v.ClienteID = c.ClienteID
JOIN Empleados e ON v.EmpleadoID = e.EmpleadoID
JOIN  DetallesVenta d ON v.VentaID = d.VentaID
GROUP BY v.VentaID, c.Nombre, e.Nombre, v.Fecha

SELECT * FROM VistaVentasResumen;

/*
	5) Funciones definidas por el usuario
	--------------------------------------------------------------------------------------------------------------
	A) Crear una funcion que calcule el IVA (21%) de un monto.

	B) Crear una funcion que reciba un VentaID y develva el total de esa venta.

	--------------------------------------------------------------------------------------------------------------
*/

CREATE FUNCTION CalcularIVA(@monto DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
	RETURN @monto * 0.21;
END;

-- USO
SELECT dbo.CalcularIVA(100) AS IVA;

CREATE FUNCTION TotalVenta(@ventaID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
	DECLARE @total DECIMAL(10,2);
	SELECT @TOTAL = SUM(Cantidad * PrecioUnitario)
	FROM DetallesVenta
	WHERE VentaID = @ventaID;
	RETURN @total;
END;

--USO
SELECT dbo.TotalVenta(1) AS TotalVenta1;
/*
	6) Indices
	--------------------------------------------------------------------------------------------------------------
	A) Crear un indice en la columna Nombre de la tabla Clientes.

	B) Crear un indice en la columna Fecha de la tabla Ventas.

*/

CREATE INDEX idx_NombreCliente ON Clientes(Nombre);

CREATE INDEX idx_FechaVenta ON Ventas(Fecha);





