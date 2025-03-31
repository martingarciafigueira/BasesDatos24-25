
--Ejercicio 1
SELECT	Nombre AS Pais, 
		GovernmentForm AS 'Forma de gobierno'
FROM country 
WHERE GovernmentForm NOT LIKE '%Republic%'

--Ejercicio 2
select continent AS 'Continente', 
	  COUNT(nombre) AS 'Nº de paises' 
from country
GROUP BY Continent
ORDER BY Continent

-- Ejercicio 3
	--Forma 1
	select ci.name 
	from country co
			inner join city ci on co.code = ci.countrycode
	where co.headofstate = 'Bernard Dowiyogo'

	--Forma 2
	SELECT name AS Ciudad
	FROM city
	WHERE CountryCode like (SELECT code FROM country WHERE HeadofState LIKE 'Bernard Dowiyogo')

--Ejercicio 4
	--Forma 1
	Select Population as poblacion,
			Nombre as pais
	from  country
	where  code like (select CountryCode from city where Name = 'Bismil')

	--Forma 2
	SELECT	--C.Name'CIUDAD',
			P.Population 'POBLACION',
			P.Nombre'PAIS' 
	FROM city C
	JOIN country P ON C.CountryCode=P.Code
	WHERE C.Name='Bismil'

--Ejercicio 5

SELECT	co.Nombre AS "País",
		co.LifeExpectancy AS "Esperanza de vida" 
FROM country co
WHERE co.LifeExpectancy >(SELECT AVG(LifeExpectancy)FROM country)
ORDER BY co.LifeExpectancy DESC;

--Ejercicio 6

SELECT DISTINCT
		C1.Name AS Ciudad,
	    C1.CountryCode AS 'Codigo Pais' 
FROM city AS C1
	INNER JOIN city AS C2 ON C1.CountryCode = C2.CountryCode AND C1.Name <> C2.Name
ORDER BY C1.CountryCode, c1.Name
