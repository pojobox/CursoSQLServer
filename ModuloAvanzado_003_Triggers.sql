-- Crear tabla de auditorias 

CREATE TABLE AuditoriaVentas
(
	AuditoriaID INT IDENTITY PRIMARY KEY,
	VentaID INT,
	FechaAuditoria DATE
);

-- Crear un trigger que registre en AudotiriaVentas cada vez que se inserte una nueva venta

CREATE TRIGGER tr_InsertarAuditoria
ON Ventas
AFTER INSERT
AS
BEGIN
	INSERT INTO AuditoriaVentas(VentaID,FechaAuditoria)
	SELECT VentaID, Fecha FROM INSERTED;
END;


--Insertar una venta de prueba
INSERT INTO Ventas(Fecha,ClienteID,EmpleadoID)
VALUES('2024-06-20', 4, 4)

--Verificar si se activo el trigger

SELECT * FROM AuditoriaVentas;

--Eliminar trigger
DROP TRIGGER tr_InsertarAuditoria