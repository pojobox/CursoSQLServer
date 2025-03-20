--Crear INDEX en una columna especifica

CREATE INDEX idx_nombre_cliente ON Clientes(Nombre);

-- ELIMINAR el INDEX

DROP INDEX idx_nombre_cliente ON Clientes;

-- SHOW PLAN 

SET SHOWPLAN_ALL ON;
GO
SELECT * FROM Clientes WHERE Nombre LIKE 'Juan%';
GO
SET SHOWPLAN_ALL OFF;


/*
Metodo			Como funciona							Rendimiento
Table scan		Lee todas las filas de la tabla			Lento si hay muchos registros
Index seek		Busca directamente en el indice			Mucho mas rapido
*/

