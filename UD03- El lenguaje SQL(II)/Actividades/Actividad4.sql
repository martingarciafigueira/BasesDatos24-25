
SELECT * FROM Futbolistas
SELECT * FROM Equipos

--Eliminar un jugador de un equipo.
DELETE Futbolistas	
WHERE Codigo = 'AM0004'

--Eliminar los equipos italianos.
DELETE Equipos
WHERE Pais LIKE 'Italia'

--Eliminar un equipo de La Liga, y por lo tanto, a todos sus jugadores.
DELETE FROM Equipos
WHERE Codigo = '#GETAFE'

--Eliminar a todos los porteros de los equipos.
DELETE FROM Futbolistas
WHERE Posicion LIKE 'Portero'

--Eliminar a todos los canteranos de los equipos (no tienen dorsal entre 1 y 25)
DELETE FROM Futbolistas
WHERE Dorsal > 25

--Eliminar a aquellos jugadores que se hayan retirado ( o pasen de 40 años)

INSERT INTO Equipos (Codigo, Nombre)
VALUES ('RETIRADO', 'RETIRADO') 

UPDATE Futbolistas
SET CodigoEquipo = 'RETIRADO', Dorsal = 0
WHERE Codigo = 'RM0010'

DELETE FROM Futbolistas
WHERE Dorsal = 0 OR Edad > 40 OR CodigoEquipo = 'RETIRADO'

--Eliminar a aquellos equipos que tengan menos de 23 jugadores (y, por supuesto, a sus jugadores)

--Solo con los equipos que tuvieran futbolistas
DELETE FROM Equipos
WHERE Codigo IN (SELECT CodigoEquipo
FROM Futbolistas
GROUP BY CodigoEquipo
HAVING COUNT(Nombre) < 23)


--Mejorada: Con todos los equipos
delete from equipos
	where codigo in (
		select e.codigo from equipos e
		left join futbolistas f on e.codigo = f.CodigoEquipo
		group by e.codigo
		having count(f.nombre) < 23
	)