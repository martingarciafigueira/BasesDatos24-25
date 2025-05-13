

--1
CREATE VIEW Ej1 AS
SELECT * FROM T_Clientes

SELECT * FROM Ej1
ORDER BY fecha_nacimiento DESC

--2
CREATE VIEW Ej2 AS
SELECT pe.*, pr.nombre, pr.precio
FROM T_Pedidos pe
INNER JOIN T_Productos pr on pe.id_producto = pr.id_producto

SELECT * FROM Ej2

--3
CREATE VIEW Ej3 AS
SELECT nombre, puesto
FROM T_Empleados
WHERE apellido LIKE 'G%'

--4

CREATE VIEW Ej4 AS
SELECT nombre, stock
FROM T_Productos

UPDATE Ej4
SET stock=57
WHERE nombre = 'Zapatos'

--5
CREATE VIEW Ej5 AS
SELECT * FROM T_Clientes

UPDATE Ej5
SET fecha_nacimiento = '01/03/1992'
WHERE nombre = 'Hugo'

SELECT * FROM Ej5