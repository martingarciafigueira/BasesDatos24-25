--1
SELECT * FROM Futbolistas
ORDER BY Nombre
--2
SELECT * FROM Equipos
ORDER BY Pais
--3
SELECT * FROM Futbolistas
ORDER BY Posicion, Nombre

--4
SELECT Nombre FROM Equipos
WHERE Pais LIKE 'España'
UNION ALL
SELECT Nombre FROM Equipos
WHERE Pais NOT LIKE 'España'

--Forma 1
SELECT e.Nombre, COUNT(f.Nombre) AS NumeroFutbolistas FROM Equipos e
LEFT JOIN Futbolistas f ON e.Codigo = f.CodigoEquipo
GROUP BY e.Nombre
ORDER BY NumeroFutbolistas

--Forma 2
CREATE VIEW v1 AS 
SELECT e.Nombre, COUNT(f.Nombre) AS NumeroFutbolistas FROM Equipos e
LEFT JOIN Futbolistas f ON e.Codigo = f.CodigoEquipo
GROUP BY e.Nombre

SELECT * FROM v1
ORDER BY NumeroFutbolistas

--Forma 3 (No debería funcionar, y no funciona)
CREATE VIEW Montecastelo AS
SELECT e.Nombre, COUNT(f.Nombre) AS NumeroFutbolistas FROM Equipos e
LEFT JOIN Futbolistas f ON e.Codigo = f.CodigoEquipo
GROUP BY e.Nombre
ORDER BY NumeroFutbolistas
