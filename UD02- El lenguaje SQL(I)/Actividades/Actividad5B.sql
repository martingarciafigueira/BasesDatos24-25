
--1
SELECT f.Nombre, e.Nombre FROM Futbolistas f
INNER JOIN Equipos e on f.CodigoEquipo = e.Codigo

--2
SELECT e.Nombre, f.Nombre FROM Equipos e
LEFT JOIN Futbolistas f on e.Codigo = f.CodigoEquipo
ORDER BY e.Nombre

--3
SELECT e.Nombre, f.Nombre FROM Futbolistas f
CROSS JOIN Equipos e 
ORDER BY e.Nombre

