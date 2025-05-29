-- crear tabla ventas

CREATE TABLE Ventas
(
	VentaID INT PRIMARY KEY IDENTITY,
	Fecha DATE,
	ClienteID INT,
	EmpleadoID INT
);

--crear stored procedure simple

CREATE PROCEDURE InsertarVentaFija
AS
BEGIN
	INSERT INTO Ventas(Fecha,ClienteID,EmpleadoID)
	VALUES(GETDATE(),1,1);
END;

-- Ejecutar stored procedure

EXEC InsertarVentaFija;


--Verificar insercion

SELECT * FROM Ventas;