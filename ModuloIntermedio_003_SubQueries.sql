

--Sub consultas --
--Clausula Where--

SELECT Nombre,Precio
FROM Productos
WHERE Precio > (SELECT AVG(Precio)FROM Productos);

-- Clausula Select--

SELECT Nombre, (SELECT COUNT(*) FROM Pedidos WHERE Pedidos.ClienteID = Clientes.ClienteID) AS TotalPedidos
FROM Clientes;

