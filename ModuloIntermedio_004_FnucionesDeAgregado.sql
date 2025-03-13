--Funciones de agregado --

-- COUNT() --

SELECT COUNT(*) FROM Pedidos;

-- SUM() --

SELECT SUM(Precio) FROM Productos;

-- AVG() --

SELECT AVG(Precio) FROM Productos;

-- MIN() , MAX() --

SELECT MIN(Precio) AS Minimo, MAX(Precio) AS Maximo FROM Productos;

