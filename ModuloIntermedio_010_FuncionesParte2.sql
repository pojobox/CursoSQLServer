-- funcion escalar simple que devuelva el IVA de un precio dado (21%)

CREATE FUNCTION CalcularIVA(@precio DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
RETURN @precio * 0.21
END;


SELECT dbo.CalcularIVA(100) AS IVA;

-- funcion escalar que devuelva el nombre completo de un cliente

CREATE FUNCTION NombreCompleto
(
	@nombre NVARCHAR(50),
	@apellido NVARCHAR(50)
)
RETURNS NVARCHAR(100)
AS
BEGIN
RETURN @nombre + ' ' + @apellido
END;



SELECT dbo.NombreCompleto(Nombre, Apellido) AS
NombreCompleto
FROM Clientes;


-- ELIMINAR FUNCION
DROP FUNCTION NombreCompleto;

-- crear una funcion que devuelva las ventas de un producto id especifico

CREATE FUNCTION VentasPorID(@productoID INT)
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM Ventas WHERE ProductoID = @productoID
)

SELECT * FROM dbo.VentasPorID(3);