
--Ej1
SELECT nif from socios
UNION 
SELECT nif from prestamos

--Ej2
SELECT nif from socios
INTERSECT
SELECT nif from prestamos

--EJ3
SELECT nif from socios
EXCEPT
SELECT nif from prestamos