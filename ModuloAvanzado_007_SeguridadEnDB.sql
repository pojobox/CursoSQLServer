--Crear usuario para loguear 
CREATE LOGIN UsuarioCurso WITH PASSWORD = 'Segura123';

--Crear usuario dentro de una base especifica
CREATE USER UsuarioCurso FOR LOGIN UsuarioCurso;

--Dar permisos
GRANT SELECT ON Productos TO UsuarioCurso;

--El usuario puede leer los productos
SELECT * From Productos;

--Que pasa si tratamos de eliminar.
DELETE FROM Productos WHERE ProductoID = 1;

--Crear tabla usuarios

CREATE TABLE Usuarios(
	UsuarioID INT,
	Nombre VARCHAR(50),
	Contrasenia VARBINARY(64)
)

--Insertar contraseña encriptada
INSERT INTO Usuarios(UsuarioID,Nombre,Contrasenia)
VALUES(1, 'admin', HASHBYTES('SHA2_256', 'miClave123'));

--Corroborar que la Contraseña esta encriptada
Select * from Usuarios;