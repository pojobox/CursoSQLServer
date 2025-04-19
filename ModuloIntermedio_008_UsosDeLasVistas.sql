-- Crear nueva DB
CREATE DATABASE VistasDB;
GO


--Tabla Empleados 
CREATE TABLE Empleados (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Puesto VARCHAR(100),
    Salario DECIMAL(10,2)
);

INSERT INTO Empleados (ID, Nombre, Puesto, Salario) VALUES
(1, 'Lucía Gómez', 'Gerente', 85000),
(2, 'Carlos Pérez', 'Vendedor', 45000),
(3, 'Ana Martínez', 'Administrativo', 40000);


--Tabla Ventas 
CREATE TABLE Ventas (
    ID INT PRIMARY KEY,
    Fecha DATE,
    Total DECIMAL(10,2),
    ClienteID INT
);

INSERT INTO Ventas (ID, Fecha, Total, ClienteID) VALUES
(1, '2024-01-15', 1500.00, 1),
(2, '2024-01-28', 2300.00, 2),
(3, '2024-02-10', 1100.00, 1),
(4, '2024-02-20', 900.00, 3);



--Tabla productos 
CREATE TABLE Productos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Precio DECIMAL(10,2),
    Costo DECIMAL(10,2)
);

INSERT INTO Productos (ID, Nombre, Precio, Costo) VALUES
(1, 'Gaseosa Cola', 150.00, 100.00),
(2, 'Galletas Dulces', 120.00, 80.00),
(3, 'Agua Mineral', 100.00, 60.00);


-- Crear tabla Clientes
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Correo VARCHAR(100),
	Estado NVARCHAR(10)
);

INSERT INTO Clientes (ID, Nombre, Correo,Estado) VALUES
(1, 'Juan Pérez', 'juan@example.com','Activo'),
(2, 'María López', 'maria@example.com','Activo'),
(3, 'Pedro Ramírez', 'pedro@example.com','Inactivo');


-- Reutilizar una consulta compleja

CREATE VIEW Vista_Clientes_Activos AS
SELECT ID, Nombre, Correo
FROM Clientes
WHERE Estado = 'Activo';


SELECT * FROM Vista_Clientes_Activos;

-- Ocultar informacion sensible

CREATE VIEW Vista_Empleados_Publica AS
SELECT ID, Nombre, Puesto
FROM Empleados;

SELECT * FROM Vista_Empleados_Publica;


-- Reporte predefinido

CREATE VIEW Ventas_Mensuales AS
SELECT
YEAR(Fecha) AS Anio,
MONTH(Fecha) AS Mes,
SUM(Total) AS TotalMensual
FROM Ventas
GROUP BY YEAR(Fecha), MONTH(Fecha);


SELECT * FROM Ventas_Mensuales;

--Simplificacion

SELECT * FROM Clientes c
JOIN Ventas v ON c.ID = v.ClienteID
WHERE v.Fecha > '2024-01-01';


CREATE VIEW Vista_ClientesConVentas AS
SELECT c.ID, c.Nombre,v.Total, v.Fecha
FROM Clientes c
JOIN Ventas v ON c.ID = v.ClienteID;

SELECT * FROM Vista_ClientesConVentas;