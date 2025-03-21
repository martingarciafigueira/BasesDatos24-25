--Empleados  2.1
Select  Apellidos
From Empleados

--Empleados  2.2
Select  distinct Apellidos
From Empleados

--Empleados  2.3
Select  *
From Empleados
where Apellidos = 'López' -- o con like

--Empleados  2.4
Select  *
From Empleados
where Apellidos = 'López' OR Apellidos = 'Pérez' -- o con like

--Empleados  2.5
Select  *
From Empleados
where Departamento = 14

--Empleados  2.6
Select  *
From Empleados
where Departamento in (37,77) -- Departamento=37 OR Departamento= 77

--Empleados  2.7
Select  *
From Empleados
where Apellidos like'p%'

--Empleados  2.8

Select SUM(Presupuesto)
From Departamentos

--Empleados  2.9  Obtener el número de empleados en cada departamento.

select [Departamento],COUNT(*) as num_empleados
From Empleados
group by Departamento

--Empleados  2.10 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.

Select *
From Empleados inner join Departamentos on Empleados.Departamento = Departamentos.Codigo

--Empleados 2.11 Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de su departamento.

Select E.Nombre,E.Apellidos,D.Nombre, D.Presupuesto
From Empleados E inner join Departamentos D on e.Departamento= D.Codigo

--Empleados 2.12 Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000 €.

Select E.Nombre,E.Apellidos --,  D.Presupuesto
From Empleados E inner join Departamentos D on e.Departamento= D.Codigo
where D.Presupuesto> 60000

--Empleados 2.13 Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.

Select *
From Departamentos D
where D.Presupuesto > (	Select AVG(Presupuesto) From Departamentos)

--Empleados 2.14 Obtener los nombres (únicamente los nombres) de los departamentos que tienen más de dos empleados.

	--Forma 1
	Select D.Nombre
	From Departamentos D
	where D.Codigo in (	Select Departamento From Empleados Group by Departamento having  COUNT(*) > 2)

	--Forma 2
	select d.Nombre 
	from empleados e
		inner join departamentos d on d.Codigo = e.Departamento
	group by d.nombre
	having count(e.nombre) > 2

--Empleados 2.15 Añadir un nuevo departamento: ‘Calidad’, con presupuesto de 40.000 € y código 11. Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI: 8926710

INSERT INTO Departamentos (Codigo,Nombre,Presupuesto) VALUES(11,'Calidad',40000)

INSERT INTO Empleados(DNI,Nombre,Apellidos,Departamento) VALUES ('8926710','Esther','Vázquez',11)

-- Empleados 2.16 Aplicar un recorte presupuestario del 10% a todos los departamentos.

--UPDATE Departamentos SET Presupuesto = Presupuesto / 1.10
UPDATE Departamentos SET Presupuesto = Presupuesto * 0.9

-- Empleados 2.17  Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14).

UPDATE EMPLEADOS 
SET Departamento = 14 
WHERE Departamento = 77

--2.18. Despedir a todos los empleados que trabajan para el departamento de informática (código 14).

DELETE FROM EMPLEADOS WHERE Departamento = 14

--2.19. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000 ¤.

DELETE 
FROM EMPLEADOS 
WHERE Departamento IN 
( 
	SELECT Codigo FROM DEPARTAMENTOS WHERE Presupuesto >= 60000 
)

--2.20. Despedir a todos los empleados.

DELETE FROM Empleados