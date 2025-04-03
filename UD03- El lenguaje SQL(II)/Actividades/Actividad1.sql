--Obtener la longitud de los nombres de los futbolistas
SELECT Nombre, LEN(Nombre) AS Longitud
FROM Futbolistas

--Obtener la fecha actual
SELECT CURRENT_TIMESTAMP

--Convertir el nombre y apellidos de futbolistas a mayúsculas
SELECT UPPER(Nombre)
FROM Futbolistas

--Calcular la suma de goles de un equipo de la tabla Futbolistas
SELECT e.Nombre, SUM(f.Goles) as GolesEquipo
FROM Futbolistas f
INNER JOIN Equipos e on f.CodigoEquipo = e.Codigo
GROUP BY e.Nombre

--Calcular el promedio de goles de un equipo
SELECT CodigoEquipo, COALESCE(AVG(goles), 0)
FROM Futbolistas
GROUP BY CodigoEquipo

--Obtener el número de futbolistas de un equipo
SELECT CodigoEquipo, COUNT(Nombre) AS NumeroFutbolistas
FROM Futbolistas
GROUP BY CodigoEquipo

--Obtener el entero inferior de un promedio de goles de cada equipo
SELECT CodigoEquipo, FLOOR(AVG(goles))
FROM Futbolistas
GROUP BY CodigoEquipo

--Obtener el entero mas cercano de un promedio de goles de cada equipo
SELECT CodigoEquipo, ROUND(AVG(goles),2)
FROM Futbolistas
GROUP BY CodigoEquipo

--Obtener la longitud de SOLO EL NOMBRE de los futbolistas
SELECT Nombre, LEN(SUBSTRING(Nombre, 1, CHARINDEX(' ', Nombre + ' '))) AS LongitudNombre
FROM Futbolistas

--Calcular la suma de goles de un equipo de la tabla Futbolistas y que salgan los equipos con 0 goles
SELECT DISTINCT e.Nombre, COALESCE(SUM(f.Goles),0) as GolesEquipo
FROM Equipos e
LEFT JOIN Futbolistas f on f.CodigoEquipo = e.Codigo
GROUP BY e.Nombre

--Dame aquellos equipos en los que no juegue ningún futbolista
SELECT DISTINCT e.Nombre FROM Equipos e
LEFT JOIN Futbolistas f ON e.Codigo = f.CodigoEquipo
WHERE f.CodigoEquipo IS NULL

--Obtener el jugador que menos goles mete y el que más de un equipo (difícil)

--Obtener el jugador que más goles mete de un equipo (difícil)

CREATE VIEW Goleadores as
SELECT e.Nombre as NombreEquipo, f.Nombre as NombreFutbolista, MAX(f.Goles) AS MaxGoleador FROM Futbolistas f
INNER JOIN Equipos e on f.CodigoEquipo = e.Codigo
GROUP BY e.Nombre, f.Nombre
ORDER BY e.Nombre, MaxGoleador DESC

SELECT DISTINCT g1.* FROM Goleadores g1
WHERE g1.NombreFutbolista = (SELECT TOP 1 NombreFutbolista FROM Goleadores ORDER BY MaxGoleador DESC)
AND g1.NombreEquipo = (SELECT TOP 1 NombreEquipo FROM Goleadores ORDER BY MaxGoleador DESC)
ORDER BY NombreEquipo, MaxGoleador DESC




--SABER EL MAX GOLEADOR DE CADA EQUIPO
--SABER EL MIN GOLEADOR DE CADA EQUIPO
--UTILIZAR UN UNION

