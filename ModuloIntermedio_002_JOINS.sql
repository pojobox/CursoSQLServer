--JOINS--

-- INNER JOIN --

SELECT Clientes.Nombre, Pedidos.FechaPedido
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;

select * from clientes;

-- LEFT JOIN --

SELECT Clientes.Nombre, Pedidos.FechaPedido
FROM Clientes
LEFT JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;

-- RIGHT JOIN --

SELECT Pedidos.PedidoID, Clientes.Nombre
FROM Pedidos
RIGHT JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;

-- FULL JOIN --

SELECT Clientes.Nombre, Pedidos.FechaPedido
FROM Clientes 
FULL JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;

/* Resumen general de los JOINs:
Tipo de JOIN	Que devuelve?
INNER JOIN	Solo los registros con coincidencia en ambas tablas.
LEFT JOIN	Todos los registros de la tabla izquierda y las coincidencias de la derecha; si no hay coincidencia, muestra NULL en la derecha.
RIGHT JOIN	Todos los registros de la tabla derecha y las coincidencias de la izquierda; si no hay coincidencia, muestra NULL en la izquierda.
FULL JOIN	Todos los registros de ambas tablas, con NULL donde no haya coincidencias.
*/



