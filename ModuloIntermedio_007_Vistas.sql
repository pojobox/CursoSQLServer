

-- Crear una vista simple
CREATE VIEW VistaClientes AS SELECT ClienteID, Nombre
FROM Clientes;


-- Consultamos la vista
SELECT * from VistaClientes;

-- crear vista con JOIN

CREATE VIEW VistaPedidosClientes AS
SELECT Pedidos.PedidoID, Clientes.Nombre,
Pedidos.FechaPedido
FROM Pedidos
INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;


SELECT * FROM VistaPedidosClientes;

-- Crear vista con funciones de agregado

CREATE VIEW VistaTotalPedidos AS
SELECT ClienteID, COUNT(*) AS TotalPedidos
FROM Pedidos
GROUP BY ClienteID;


SELECT * FROM VistaTotalPedidos;

-- alterar una vista

ALTER VIEW VistaClientes AS
SELECT ClienteID, Nombre, Telefono
FROM CLientes;

SELECT * FROM VistaClientes;

--Eliminar Vista

DROP VIEW VistaClientes;

