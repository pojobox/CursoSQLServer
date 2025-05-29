-- Insertar una venta dinamica (Con parametros de entrada)

CREATE PROCEDURE InsertarVenta
	@Fecha DATE,
	@ClienteID INT,
	@EmpleadoID INT
AS
BEGIN
	INSERT INTO Ventas(Fecha,ClienteID,EmpleadoID)
	VALUES(@Fecha,@ClienteID,@EmpleadoID);
END;

--Ejecutar procedimiento

EXEC InsertarVenta '2024-07-10',2,1;

SELECT * FROM Ventas;

--Crear tabla detalle ventas

CREATE TABLE DetallesVenta
(
	DetalleID INT PRIMARY KEY,
	VentaID INT,
	ProductoID INT,
	Cantidad INT,
	PrecioUnitario DECIMAL(10,2)
);

-- Crear procedimiento con parametro de salida y una relacion entre ventas y cliente

CREATE PROCEDURE TotalComprasCliente
	@ClienteID INT,
	@Total DECIMAL(10,2) OUTPUT
AS
BEGIN
	SELECT @Total = SUM(d.Cantidad * d.PrecioUnitario)
	FROM Ventas v
	JOIN DetallesVenta d ON v.VentaID = d.VentaID
	WHERE v.ClienteID = @ClienteID;
END;

DECLARE @Resultado DECIMAL(10,2);

EXEC TotalComprasCliente @ClienteID = 1, @Total = @Resultado OUTPUT;

SELECT @Resultado AS TotalGastado;