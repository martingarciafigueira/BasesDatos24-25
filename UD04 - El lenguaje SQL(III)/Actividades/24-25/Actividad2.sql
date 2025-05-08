DROP DATABASE IF EXISTS Actividad2_Tema4;
GO
CREATE DATABASE Actividad2_Tema4;
GO
USE Actividad2_Tema4;
GO

CREATE TABLE T_Empleados(
Id_empleado int IDENTITY(1,1) PRIMARY KEY,
salario int CHECK(salario between 1184 and 5000));

CREATE TABLE T_Productos(
Id_producto int IDENTITY(1,1) PRIMARY KEY,
precio float CHECK(precio >= 0));

CREATE TABLE T_Clientes(
Id_cliente int IDENTITY(1,1) PRIMARY KEY NOT NULL,
nombre varchar(50) NOT NULL,
apellidos varchar(50) NOT NULL,
fecha date NOT NULL);

CREATE TABLE T_Estudiantes(
Id_estudiante int IDENTITY(1,1) PRIMARY KEY NOT NULL,
nombre varchar(50) NOT NULL);

CREATE TABLE T_Pedidos(
Id_pedido int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Id_cliente int REFERENCES T_Clientes(id_cliente),
Id_producto int REFERENCES T_Productos(Id_Producto));