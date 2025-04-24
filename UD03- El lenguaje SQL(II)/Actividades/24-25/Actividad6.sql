--Realizar una transacción para agregar un nuevo jugador y actualizar la lista de goles de un equipo con los goles de ese jugador

BEGIN TRANSACTION
BEGIN TRY

		SELECT COUNT(*) AS NumeroJugadores FROM Futbolistas

		INSERT INTO Futbolistas (Codigo, Nombre, CodigoEquipo, Edad, Goles, Dorsal) VALUES ('FCB0035','Lamine Yamal', '#FCBLNA', 17, 4, 19)

		SELECT COUNT(*) AS NumeroJugadores FROM Futbolistas

		UPDATE Equipos
		SET Goles += (SELECT Goles FROM Futbolistas WHERE Codigo = 'FCB0035')
		WHERE Codigo = (SELECT CodigoEquipo FROM Futbolistas WHERE Codigo = 'FCB0035')

COMMIT TRANSACTION 
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION

END CATCH

--Realizar una transacción para mover a un jugador de un equipo y no restar la cantidad de goles pero sí sumársela al nuevo equipo.

BEGIN TRANSACTION
BEGIN TRY

UPDATE Futbolistas
SET CodigoEquipo = '#RCELTA'
WHERE Codigo = 'GR0024'

UPDATE Equipos
SET Goles += (SELECT Goles FROM Futbolistas WHERE Codigo = 'GR0024')
WHERE Codigo = (SELECT CodigoEquipo FROM Futbolistas WHERE Codigo = 'GR0024')

COMMIT TRANSACTION 
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION

END CATCH

--Realizar una transacción para agregar un nuevo equipo y agregar 2 jugadores nuevos a ese equipo.

BEGIN TRANSACTION
	BEGIN TRY
	INSERT INTO Equipos (Codigo, Nombre,Estadio) VALUES ('RAPIDO', 'Rápido de Bouzas', 'Baltasar Pujales')
	INSERT INTO Futbolistas (Codigo, Nombre, CodigoEquipo) VALUES ('RP001', 'Charles', 'RAPIDO')
	INSERT INTO Futbolistas (Codigo, Nombre, CodigoEquipo) VALUES ('RP002', 'Larrivey', 'RAPIDO')
	COMMIT
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH

--Inserta dos jugadores y dos equipos con el mismo código y comprueba que no se realice ninguna inserción

BEGIN TRANSACTION
	BEGIN TRY
	INSERT INTO Equipos (Codigo, Nombre,Estadio) VALUES ('RAPIDO', 'Rápido de Bouzas', 'Baltasar Pujales')
	INSERT INTO Equipos (Codigo, Nombre,Estadio) VALUES ('RAPIDO', 'Rápido de Bouzas', 'Baltasar Pujales')
	INSERT INTO Futbolistas (Codigo, Nombre, CodigoEquipo) VALUES ('RP002', 'Larrivey', 'RAPIDO')
	INSERT INTO Futbolistas (Codigo, Nombre, CodigoEquipo) VALUES ('RP002', 'Larrivey', 'RAPIDO')
	COMMIT
END TRY

BEGIN CATCH
	Print 'ERROR!'
	ROLLBACK TRANSACTION
END CATCH
