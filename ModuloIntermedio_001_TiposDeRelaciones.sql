-- ************************************************** PK Y FK**************************************************

-- Definir PK Creando una tabla

CREATE TABLE Productos
(
	ProductoID INT PRIMARY KEY,
	Nombre NVARCHAR(100),
	Precio DECIMAL(10,2)
);

-- Definir PK en una tabla ya creada.

CREATE TABLE Productos
(
	ProductoID INT,
	Nombre NVARCHAR(100),
	Precio DECIMAL(10,2)
);

-- Solucion a error de el campo primary key no debe ser nulleable.
ALTER TABLE Productos ALTER COLUMN ProductoID INT NOT NULL;

-- Definir el campo ProductoID como PK.
ALTER TABLE Productos ADD CONSTRAINT PK_Producto PRIMARY KEY (ProductoID);

-- Crear tabla de ventas

CREATE TABLE Ventas
(
	VentaID INT PRIMARY KEY,
	ProductoID INT,
	Cantidad INT,
	FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Definir FK en tabla ya creada


CREATE TABLE Ventas
(
	VentaID INT PRIMARY KEY,
	ProductoID INT,
	Cantidad INT
);

ALTER TABLE Ventas ADD CONSTRAINT FK_Producto FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID);

-- ************************************************** TIPOS DE RELACIONES**************************************************

-- Relacion uno a uno

CREATE TABLE Personas
(
	PersonaID INT PRIMARY KEY,
	Nombre NVARCHAR(50)
);

CREATE TABLE Pasaportes
(
	PasaporteID INT PRIMARY KEY,
	PersonaID INT UNIQUE,
	NumeroPasaporte NVARCHAR(20),
	FOREIGN KEY (PersonaID) REFERENCES Personas(PersonaID)
);

-- Insertar datos de prueba

INSERT INTO Personas(PersonaID, Nombre) VALUES (1, 'Juan Perez');
INSERT INTO Personas(PersonaID, Nombre) VALUES (2, 'Alberto Juarez');

INSERT INTO Pasaportes (PasaporteID,PersonaID,NumeroPasaporte)
VALUES(1,1,'A123456'), (2,2,'B987654');

SELECT * FROM Pasaportes;

SELECT * FROM Personas;

-- Relacion uno a muchos

CREATE TABLE Clientes
(
	ClienteID INT PRIMARY KEY,
	Nombre NVARCHAR(50)
);

CREATE TABLE Pedidos
(
	PedidoID INT PRIMARY KEY,
	ClienteID INT,
	FechaPedido DATE,
	FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Insertar datos de prueba


INSERT INTO Clientes(ClienteID, Nombre) VALUES (1, 'Pepe Gomez');
INSERT INTO Clientes(ClienteID, Nombre) VALUES (2, 'Carlos Gonzales');

INSERT INTO Pedidos (PedidoID,ClienteID,FechaPedido)
VALUES(1,1,'2025-02-16'), (2,1,'2025-02-16'), (3,2,'2025-02-16');

SELECT * FROM Pedidos;

-- Relacion muchos a muchos

CREATE TABLE Estudiantes
(
	EstudianteID INT PRIMARY KEY,
	Nombre NVARCHAR(50)
);

CREATE TABLE Cursos
(
	CursoID INT PRIMARY KEY,
	NombreCurso NVARCHAR(50)
);

CREATE TABLE Inscripciones
(
	EstudianteID INT,
	CursoID INT,
	FechaInscripcion DATE,
	PRIMARY KEY(EstudianteID, CursoID),
	FOREIGN KEY(EstudianteID) REFERENCES Estudiantes(EstudianteID),
	FOREIGN KEY(CursoID) REFERENCES Cursos(CursoID)
);

-- Insertar datos de prueba

INSERT INTO Estudiantes(EstudianteID,Nombre) VALUES(1, 'Pepe Martinez');
INSERT INTO Estudiantes(EstudianteID,Nombre) VALUES(2, 'Laura Sanchez');

INSERT INTO Cursos(CursoID,NombreCurso) VALUES(1, 'Matematicas');
INSERT INTO Cursos(CursoID,NombreCurso) VALUES(2, 'Fisica');
INSERT INTO Cursos(CursoID,NombreCurso) VALUES(3, 'Quimica');


INSERT INTO Inscripciones(EstudianteID,CursoID, FechaInscripcion) 
VALUES(1,1,'2025-02-16'),(1,2,'2025-02-16'),(2,3,'2025-02-16');

select * from Inscripciones;

--EJEMPLLO DE JOIN
SELECT *
FROM Cursos AS CUR
LEFT JOIN Inscripciones AS INSC ON INSC.CursoID = CUR.CursoID
LEFT JOIN Estudiantes AS EST ON INSC.EstudianteID = EST.EstudianteID;