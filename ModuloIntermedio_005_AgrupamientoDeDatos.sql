--Agrupamiento de datos --

--Group by--

SELECT ClienteID , COUNT(*) AS TotalPedidos
FROM Pedidos
GROUP BY ClienteID;

-- HAVING --

SELECT ClienteID, COUNT(*) AS TotalPedidos
FROM Pedidos
GROUP BY ClienteID
HAVING COUNT(*) >= 2;

--Ejercicio:
/*
	Consultas avanzadas con JOINS y Funciones de agregado, vamos a utilizar las tres tablas Clientes,Pedidos y Productos
	Objetivo:
	Obtener un reporte que muestre el nombre de los clientes , 
	el numero de pedidos que han realizado y el total gastado por cada cliente en todos sus pedidos.
*/

SELECT Clientes.Nombre,
	COUNT(Pedidos.PedidoID) AS TotalPedidos,
	SUM(Productos.Precio) AS TotalGastado
	FROM Clientes
	INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
	INNER JOIN Productos ON Pedidos.PedidoID = Productos.PedidoID
	GROUP BY Clientes.Nombre;