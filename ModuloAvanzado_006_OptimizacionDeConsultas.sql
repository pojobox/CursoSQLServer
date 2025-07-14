--Ejemplo: Detectar y mejorar una consulta lenta


--Crear tabla faltante
CREATE TABLE Productos(
	ProductoID INT PRIMARY KEY,
	Nombre VARCHAR(50),
	Precio DECIMAL(10,2)
)

--Crear consulta ineficiente

SELECT * FROM Productos p, DetallesVenta d
WHERE p.ProductoID = d.ProductoID;


--Version optimizada
SELECT p.Nombre, d.Cantidad
FROM Productos p
INNER JOIN DetallesVenta d ON p.ProductoID = d.ProductoID;