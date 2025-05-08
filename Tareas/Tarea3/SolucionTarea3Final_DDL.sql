
-------------------------------------------------------------------
-------------------------------------------------------------------
/*--Consultas SELECT Nivel: Difícil--------------------------------
1. Seleccionar el nombre del cliente y el producto más caro comprado por cada  cliente. 
2. Seleccionar el nombre del producto, el total gastado en ese producto y el  porcentaje del total de ventas que representa ese producto. 
3. Seleccionar el nombre del cliente y el total gastado por cada cliente en  productos que empiezan por "M". 
4. Seleccionar el nombre del producto y el número de compras en las que se ha  vendido más de una unidad del producto. 
5. Seleccionar el nombre del cliente que más ha gastado, junto con el total gastado.
6. Seleccionar los productos que tienen un precio mayor que el promedio de los  precios de todos los productos. 
7. Seleccionar los productos que han sido comprados por más de un cliente. 
8. Muestra, agrupado por año y mes, la cantidad de compras que ha realizado cada cliente, junto con el total gastado.
*/

-- 1. Seleccionar el nombre del cliente y el producto más caro comprado por cada cliente.
-- Nombre del cliente  |  Producto más caro comprado
SELECT DISTINCT cl.nombre 'Ej. 1. Nombre de Cliente', p.nombre 'Nombre producto más caro comprado por dicho cliente'
FROM clientes cl
INNER JOIN compras co ON co.id_cliente=cl.id
INNER JOIN detalles_compra dc ON dc.id_compra=co.id
INNER JOIN productos p ON p.id=dc.id_producto
INNER JOIN 
(SELECT DISTINCT cl.nombre 'Nombre de Cliente', MAX(dc.precio_unitario) 'Precio'
FROM clientes cl
INNER JOIN compras co ON co.id_cliente=cl.id
INNER JOIN detalles_compra dc ON dc.id_compra=co.id
INNER JOIN productos p ON p.id=dc.id_producto
GROUP BY cl.nombre) cp
ON cl.nombre = cp.[Nombre de Cliente] AND p.precio_unitario = cp.Precio

-- 2. Seleccionar el nombre del producto, el total gastado en ese producto y el porcentaje del total de ventas que representa ese producto
SELECT	p.nombre 'Ej.2. Nombre del producto', 
		CONVERT(VARCHAR(10), SUM(dc.cantidad*dc.precio_unitario))+' €' 'Total gastado en el producto', 
		SUBSTRING(CONVERT(VARCHAR(10), 100*SUM(dc.cantidad*dc.precio_unitario)/(SELECT SUM(dc.cantidad*dc.precio_unitario)FROM detalles_compra dc),2),1,5)
			+'  %' 'Porcentaje del total de ventas que representa'
FROM productos p
INNER JOIN detalles_compra dc ON dc.id_producto=p.id
GROUP BY p.nombre
ORDER BY SUM(dc.cantidad*dc.precio_unitario) DESC

-- 3. Seleccionar el nombre del cliente y el total gastado por cada cliente en  productos que empiezan por "P"
SELECT c.nombre 'Ej. 3. Nombre cliente', SUM(dc.cantidad * dc.precio_unitario) AS total_gastado
FROM clientes c
INNER JOIN compras co ON c.id = co.id_cliente
INNER JOIN detalles_compra dc ON co.id = dc.id_compra
INNER JOIN productos p ON dc.id_producto = p.id
WHERE p.nombre LIKE 'M%'
GROUP BY c.nombre;

--4. Seleccionar el nombre del producto y el número de compras en las que se ha vendido más de una unidad del producto. 
SELECT p.nombre 'Ej.4. Nombre Producto', COUNT(dc.id_producto) 'Nº de compras en las que se ha vendido más de una unidad del producto'
FROM detalles_compra dc 
INNER JOIN productos p ON p.id=dc.id_producto
WHERE dc.cantidad>1
GROUP BY p.nombre
ORDER BY [Nº de compras en las que se ha vendido más de una unidad del producto] DESC

-- 5. Seleccionar el nombre del cliente que más ha gastado en una sola compra
SELECT cl.nombre 'Ej. 5. Cliente que más ha gastado en una sola compra'
FROM clientes cl
INNER JOIN compras co ON co.id_cliente=cl.id
INNER JOIN detalles_compra dc ON dc.id_compra=co.id
INNER JOIN (
	SELECT TOP(1) dc.id_compra, SUM(dc.cantidad*dc.precio_unitario) [Coste compra]
	FROM clientes cl
	INNER JOIN compras co ON co.id_cliente=cl.id
	INNER JOIN detalles_compra dc ON dc.id_compra=co.id
	GROUP BY dc.id_compra
	ORDER BY [Coste compra] DESC
	) tgc ON tgc.id_compra=co.id
GROUP BY cl.nombre

-- 6. Seleccionar los productos que tienen un precio mayor que el promedio de los  precios de todos los productos. 
SELECT nombre 'Ej. 7. Nombre producto con precio > Precio promedio de todos los productos', id, CONVERT(VARCHAR(10), precio_unitario)+' €' 'Precio del producto'
FROM productos
WHERE precio_unitario> (SELECT AVG(precio_unitario) FROM productos)

-- 7. Seleccionar los productos que han sido comprados por más de un cliente. 
SELECT p.nombre 'Ej. 8. Productos que han sido comprados por más de un cliente'
FROM productos p
INNER JOIN detalles_compra dc ON dc.id_producto=p.id
INNER JOIN compras co ON co.id=dc.id_compra
INNER JOIN clientes cl ON cl.id=co.id_cliente
GROUP BY p.nombre
HAVING COUNT(DISTINCT cl.id)>1

-- 8. Muestra, agrupado por año y mes, la cantidad de compras que ha realizado cada cliente, junto con el total gastado.
SELECT c.*, SUM(dc.cantidad * dc.precio_unitario) AS total_compra
FROM clientes c
INNER JOIN compras co ON c.id = co.id_cliente
INNER JOIN detalles_compra dc ON co.id = dc.id_compra
GROUP BY c.id, c.nombre, c.correo_electronico, c.direccion
HAVING COUNT(DISTINCT dc.id_producto) > 1;

--********************TAREA 3 EJERCICIO 2**************************

DROP DATABASE IF EXISTS Tarea3Ejer2
GO
--Creamos la base de datos
CREATE DATABASE Tarea3Ejer2
GO
--Usamos la base de datos
USE Tarea3Ejer2
GO

CREATE TABLE espectaculo(
COD_espectaculo char(5) PRIMARY KEY,
nombre varchar(50) NOT NULL,
tipo varchar(10) NOT NULL,
fecha_inicial datetime NOT NULL,
fecha_final datetime NOT NULL,
interprete varchar(50) NOT NULL);

CREATE TABLE recintos(
COD_recinto int PRIMARY KEY,
nombre varchar(20) NOT NULL, 
direccion varchar(50) NOT NULL,
ciudad varchar(50) NOT NULL,
telefono char(9) NOT NULL,
horario time NOT NULL);

CREATE TABLE zonas_recintos(
COD_recinto int REFERENCES recintos(COD_recinto) ON DELETE CASCADE,
zona int NOT NULL,
capacidad int NOT NULL,
CONSTRAINT PK_zonas_recintos PRIMARY KEY(COD_recinto,zona));

CREATE TABLE asientos(
COD_recinto int,
zona int,
fila int,
numero int,
CONSTRAINT PK_asientos PRIMARY KEY(COD_recinto,zona,fila,numero),
CONSTRAINT FK_asientos FOREIGN KEY (COD_recinto,zona) REFERENCES zonas_recintos(COD_recinto,zona) ON DELETE CASCADE);

CREATE TABLE representaciones(
COD_espectaculo char(5) REFERENCES espectaculo(COD_espectaculo),
fecha datetime,
hora time,
CONSTRAINT PK_representaciones PRIMARY KEY (COD_espectaculo,fecha,hora));

CREATE TABLE espectadores(
DNI_cliente char(9) PRIMARY KEY,
nombre varchar(50) NOT NULL,
direccion varchar(50) NOT NULL,
telefono char(9) UNIQUE NOT NULL,
ciudad varchar(50) NOT NULL,
tarjeta varchar(20) NOT NULL);

CREATE TABLE entradas(
COD_entrada int PRIMARY KEY,
COD_espectaculo char(5),
fecha datetime,
hora time,
COD_recinto int,
zona int,
fila int,
numero int,
DNI_cliente char(9) REFERENCES espectadores(DNI_cliente) ON DELETE CASCADE,
CONSTRAINT FK_COD_espectaculo FOREIGN KEY (COD_espectaculo) REFERENCES espectaculo(COD_espectaculo) ON DELETE CASCADE,
CONSTRAINT FK_asientos2 FOREIGN KEY (COD_recinto,zona,fila,numero) REFERENCES asientos(COD_recinto,zona,fila,numero) ON DELETE CASCADE);


CREATE TABLE precios_espectaculos (
COD_espectaculo char(5),
COD_recinto int,
zona int,
precio float CHECK (precio >0),
CONSTRAINT PK_precios_espectaculos PRIMARY KEY (COD_espectaculo,precio),
CONSTRAINT FK_precios_espectaculos FOREIGN KEY (COD_recinto,zona) REFERENCES zonas_recintos(COD_recinto,zona) ON DELETE CASCADE);
