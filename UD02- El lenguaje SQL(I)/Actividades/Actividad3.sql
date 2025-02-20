
--Versión Martín
SELECT nif, COUNT(nif) AS 'Cantidad de veces que alquilo'
FROM prestamos
group by nif
having COUNT(nif) > 1

--Versión Miguel
select distinct p.nif 
from prestamos as p
where nif in (select nif from prestamos where nif = p.nif AND p.id != id)

--Ej2
SELECT nombre, apellidos, alta
FROM socios
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(alta) > 5