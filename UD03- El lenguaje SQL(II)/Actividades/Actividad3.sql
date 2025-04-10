--Restar 15 puntos al Barcelona por Negreirato en La Liga.
UPDATE Equipos
SET Puntos -= 15
WHERE Codigo = '#FCBLNA'

--Actualizar el valor del precio de mercado de vuestro jugador preferido en 20 millones
SELECT * FROM Futbolistas
UPDATE Futbolistas
SET PrecioMercado = '29 Mill'
WHERE Codigo = 'SV0011'

--Actualizar los partidos jugados, ganados, perdidos y empatados por el Celta a PJ:500, PG: 480, PE: 20, PP: 0

UPDATE Equipos
SET PJ = '500', PG=480, PE=20, PP=0
WHERE Codigo = '#RCELTA'

--Realizar el traspaso de un futbolista a otro equipo.
  UPDATE Futbolistas
  SET CodigoEquipo = '#FCBLNA', Codigo = 'FC0021'
  WHERE Codigo = 'AB0005'

--Hacer un intercambio de futbolistas, pero manteniendo las estadísticas actuales (Jugador1 va a Equipo2, y Jugador2 va a Equipo1)

--Mando a Messi para el Celta (Paso 1)
UPDATE Futbolistas
SET CodigoEquipo = '#RCELTA', Codigo = 'RCXX'
WHERE Codigo = 'FC0017'

--Mando a Santi Mina para el Barcelona
UPDATE Futbolistas
SET CodigoEquipo = '#FCBLNA', Codigo = 'FC0017'
WHERE Codigo = 'RC0023'

--Mando a Messi para el Celta (Paso 2)
UPDATE Futbolistas
SET CodigoEquipo = '#RCELTA', Codigo = 'RC0023'
WHERE Codigo = 'RCXX'

--Retirar a un futbolista (Cambiar su dorsal a 0 y su equipo a ‘RETIRADO’)
UPDATE Futbolistas
SET Dorsal = 0, CodigoEquipo = 'RETIRADO'
WHERE Codigo = 'RM0016'

--Mudar a un equipo de país, con todos los cambios que eso conlleva (empieza de 0 en partidos, goles, etc.)

UPDATE Equipos
SET Pais = 'Turquía', Goles = 0, PJ = 'Ninguno', PG=0, PE=0, PP=0
WHERE Codigo = '#DEPOR'



