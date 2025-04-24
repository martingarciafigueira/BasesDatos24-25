
--Genero dos tablas de respaldo
SELECT * INTO Equipos2
FROM Equipos

SELECT * INTO Futbolistas2
FROM Futbolistas

--Actualizar los datos de un jugador, si el jugador ya existe, o insertarlo si es un jugador nuevo.
MERGE INTO Futbolistas f
USING Futbolistas2 f2
ON f.Codigo= f2.Codigo
WHEN MATCHED THEN
UPDATE SET f.Nombre = f2.Nombre, f.Edad = f2.Edad
WHEN NOT MATCHED THEN
INSERT (Codigo, Nombre, Edad)
VALUES (f2.Codigo, f2.Nombre, f2.Edad);

--Actualizar los datos de un equipo, si el equipo ya existe, o insertarlo si es un equipo nuevo.
MERGE INTO Equipos e
USING Equipos2 e2
ON e.Codigo= e2.Codigo
WHEN MATCHED THEN
UPDATE SET e.Nombre = e2.Nombre
WHEN NOT MATCHED THEN
INSERT (Codigo, Nombre, Estadio)
VALUES (e2.Codigo, e2.Nombre, e2.Estadio);

--Actualizar los datos de un defensa, si el defensa ya existe, o insertarlo si es un defensa nuevo.
MERGE INTO Futbolistas f
USING Futbolistas2 f2
ON f.Codigo = f2.Codigo AND f2.Codigo = 'Defensa'
WHEN MATCHED THEN
UPDATE SET f.Nombre = f2.Nombre, f.Edad = f2.Edad
WHEN NOT MATCHED THEN
INSERT (Codigo, Nombre, Edad)
VALUES (f2.Codigo, f2.Nombre, f2.Edad);

--Borrar los datos de un equipo, si el equipo ya existe, o insertarlo si es un equipo nuevo.
MERGE INTO Equipos e
USING Equipos2 e2
ON e.Codigo= e2.Codigo
WHEN MATCHED THEN
DELETE 
WHEN NOT MATCHED THEN
INSERT (Codigo, Nombre, Estadio)
VALUES (e2.Codigo, e2.Nombre, e2.Estadio);