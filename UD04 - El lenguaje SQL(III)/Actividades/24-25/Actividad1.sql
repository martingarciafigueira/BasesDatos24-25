--Pasos para hacer un script
DROP DATABASE IF EXISTS BD_Actividades;
GO
CREATE DATABASE BD_Actividades;
GO
USE BD_Actividades;
GO
CREATE TABLE clientes(
id_cliente int,
nombre varchar(50),
apellido varchar(50),
fecha_nacimiento DATE);

CREATE TABLE productos(
id_producto int,
nombre varchar(100),
precio float,
stock int);

CREATE TABLE pedidos(
id_pedido int,
id_cliente int,
id_producto int,
cantidad int,
fecha_pedido date);

CREATE TABLE empleados(
id_empleado int,
nombre varchar(50),
apellido varchar(50),
puesto varchar(50));

CREATE TABLE ventas(
id_venta int,
id_cliente int,
id_producto int,
cantidad int,
precio float,
fecha_venta date);