-- Funciones matematicas

-- ABS
SELECT ABS(-10) AS ValorAbsoluto;

-- ROUND

SELECT ROUND(123.4567, 2) AS Redondeo;

-- POWER

SELECT POWER(2,3) AS Potencia;

-- SQRT

SELECT SQRT(25) AS RaizCuadrada;

-- CEILING
SELECT CEILING(12.70) AS RedondeoArriba;

-- FLOOR

SELECT FLOOR(12.40) AS RedondeoAbajo;

--FUNCIONES DE CADENA DE TEXTO

-- UPPER
SELECT UPPER('Hola mundo') AS Mayusculas;

-- LOWER

SELECT LOWER('HOLA COMO ESTAS?') AS Minusculas;

-- SUBSTRING

SELECT SUBSTRING('Programacion', 1, 5) AS Subcadena;

-- REPLACE

SELECT REPLACE('Hola mundo', 'mundo','SQL') AS Reemplazo;

-- FUNCIONES DE FECHA

-- GETDATE

SELECT GETDATE() AS FechaActual;

-- YEAR

SELECT YEAR(GETDATE()) AS AñoActual;

-- DATEPART

SELECT DATEPART(MONTH,'2025-04-19') AS MesExtraido;

-- DATEDIFF

SELECT DATEDIFF(DAY,'2025-04-01', GETDATE()) AS DiasTranscurridos;

