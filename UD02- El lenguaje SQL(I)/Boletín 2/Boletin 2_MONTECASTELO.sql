--Ejercicio 1.1
Select Nombre 
From Articulos
--Ejercicio 1.2
Select Nombre,Precio
From Articulos
--Ejercicio 1.3
Select Nombre
From Articulos
Where Precio <=200
--Ejercicio 1.4
	--  Opción 1
		Select *
		From Articulos
		Where Precio >= 60 and Precio <=120
	-- Opción 2
		Select *
		From Articulos
		Where Precio Between 60 and 120

--Ejercicio 1.5

Select	Nombre, 
		Precio * 166.386 as 'Precio en pesetas'
From Articulos

--Ejercicio 1.6

Select AVG(Precio)
From Articulos

--Ejercicio 1.7
Select AVG(Precio) as 'Precio medio'
From Articulos
Where Fabricante = 2

--Ejercicio 1.8
Select COUNT(*)
From Articulos
Where Precio >=180	

--Ejercicio 1.9

Select Nombre, 
		Precio
From Articulos
Where Precio >=40
Order by Precio desc, Nombre

--Ejercicio 1.10

Select *
From Articulos inner join Fabricantes on Articulos.Fabricante = Fabricantes.Codigo

--Ejercicio 1.11

Select	Articulos.Nombre,
		Articulos.Precio, 
		Fabricantes.Nombre
From Articulos inner join Fabricantes on Articulos.Fabricante = Fabricantes.Codigo

--Ejercicio 1.12

Select AVG(Precio) as 'precio medio',
		Fabricante 
From Articulos
Group by Fabricante

--Ejercicio 1.13

Select	AVG(Precio) as 'precio medio',
		Fabricantes.Nombre
from Articulos inner join Fabricantes on Articulos.Fabricante = Fabricantes.Codigo
group by Fabricantes.nombre

--Ejercicio 1.14


Select AVG(Precio) as 'precio medio',
		Fabricantes.Nombre
from Articulos inner join Fabricantes on Articulos.Fabricante = Fabricantes.Codigo
group by Fabricantes.nombre
having AVG(Precio)>=150

--Ejercicio 1.15

Select Nombre,
		Precio
From Articulos
Where Precio = (Select MIN(Precio) From Articulos)

--Ejercicio 1.16

Select A.Nombre, A.Precio, F.Nombre
from Articulos A inner join Fabricantes F on A.Fabricante = F.Codigo
where Precio = 
(
	Select MAX(Articulos.Precio)
	from Articulos
	Where Articulos.Fabricante = F.Codigo
)

--Ejercicio 1.17
--begin transaction --Inicio transacción
--Rollback -- Deshace la transacción
--commit transaction --Aplica la transacción

INSERT INTO Articulos(Nombre, Precio, Fabricante)
VALUES ('Consola',200,2)

--Ejercicio 1.18

UPDATE Articulos
SET  Nombre ='Impresora Laser'
where Codigo = 8

--select * from Articulos

--Ejercicio 1.19

UPDATE Articulos
SET Precio = Precio *0.9

--Ejercicio 1.20

UPDATE Articulos
SET Precio = Precio - 10
Where Precio >=120
