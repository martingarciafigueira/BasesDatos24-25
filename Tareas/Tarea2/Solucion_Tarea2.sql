-- Ejercicio 1

SELECT nombre, precio FROM PRODUCTO
ORDER BY nombre ASC, precio DESC

-- Ejercicio 2

SELECT * FROM PRODUCTO
where precio BETWEEN 60 AND 200

-- Ejercicio 3 

SELECT nombre FROM fabricante
Where LEN(nombre) = 4  

-- Ejercicio 4

SELECT p.nombre, precio, f.nombre FROM producto p
INNER JOIN Fabricante f
ON p.codigo_fabricante = f.codigo 

-- Ejercicio 5

SELECT p.nombre, precio, f.nombre FROM producto p
INNER JOIN Fabricante f
ON p.codigo_fabricante = f.codigo 
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR F.nombre= 'Seagate'

-- Ejercicio 6

SELECT nombre FROM fabricante 
ORDER by nombre ASC

-- Ejercicio 7

SELECT COUNT(nombre) as 'Productos' FROM producto 

-- Ejercicio 8 

SELECT f.nombre FROM fabricante f
INNER JOIN producto p
ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre 
HAVING SUM(p.precio) > '1000'

-- Ejercicio 9 

SELECT f.nombre FROM Fabricante f
LEFT JOIN producto p
ON p.codigo_fabricante = f.codigo
WHERE p.codigo_fabricante IS null

-- Ejercicio 10

SELECT f.nombre, count(CASE WHEN p.precio >= 220 THEN 1 END) as 'Numero Productos' FROM fabricante f
left JOIN producto p
ON f.codigo = p.codigo_fabricante 
GROUP BY f.nombre
ORDER By [Numero Productos] desc
