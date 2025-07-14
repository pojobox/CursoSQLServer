--Ejemplo: Insertar una venta con control de error

--Revisar la tabla para llevar un control de lo que se inserta y lo que no.
select * from ventas;

--Comando para activar el aborto de transactions
SET XACT_ABORT ON;

BEGIN TRY
	BEGIN TRANSACTION;

	--Insertar venta correcta
	INSERT INTO Ventas(Fecha, ClienteID, EmpleadoID)
	VALUES('2024-07-18',1,2);

	--Error de ejecución: division por cero
	DECLARE @x INT = 1 / 0;

	COMMIT;
END TRY
BEGIN CATCH
	ROLLBACK;
	--PRINT('Ha ocurrido un error. Transacción revertida.');
	RAISERROR('Ha ocurrido un error. La transacción fue revertida.',16,1);
END CATCH;

--RAISERROR('Mensaje', Severidad, Estado)';

/*
	Severidad Significado
	0-10		Informativo(no se considera un error)
	11-16		Errores generados por el usuario
	17-25		Errores mas graves(admistrador, sistema)
*/


