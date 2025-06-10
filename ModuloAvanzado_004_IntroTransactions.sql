--insertar datos en ventas y detallesVenta
SELECT * FROM DetallesVenta
BEGIN TRANSACTION;

--Insertar venta principal
INSERT INTO Ventas(Fecha,ClienteID,EmpleadoID)
VALUES('2024-06-10', 6,6)

-- Obtener ID recien creado
DECLARE @VentaID INT = SCOPE_IDENTITY();

--Insertar el detalle
INSERT INTO DetallesVenta(DetalleID, VentaID, ProductoID, Cantidad,PrecioUnitario)
VALUES(3,@VentaID, 3,4,150.00);

--Confirmar los cambios
COMMIT;