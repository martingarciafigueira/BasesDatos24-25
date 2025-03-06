CREATE VIEW FutbolistasGoleadoresSinTarjeta AS
SELECT * FROM Futbolistas
WHERE Goles > 5 and TA = 0 and tr = 0

CREATE VIEW EquiposEspana AS
SELECT * FROM Equipos
WHERE Pais LIKE 'España'

SELECT * FROM FutbolistasGoleadoresSinTarjeta

SELECT * FROM EquiposEspana
