
--1
SELECT * INTO #VENTAS FROM ventas
WHERE fecha_venta > DATEADD(MONTH, -3, CURRENT_TIMESTAMP)

--2
select c.nombre, c.apellido INTO #CLIENTES_ACTIVOS
from pedidos p
inner join clientes c on p.id_cliente = c.id_cliente
where p.fecha_pedido >= DATEADD(MONTH, -1, CURRENT_TIMESTAMP)

--3
SELECT * into #pedidos_procesados FROM pedidos p
where p.fecha_pedido >= DATEADD(WEEK, -1, CURRENT_TIMESTAMP)

--4A: Tabla temporal con los productos que han tenido ventas mas altas
SELECT TOP 10 p.nombre FROM ventas v
INNER JOIN productos p on v.id_producto = p.id_producto
ORDER BY v.cantidad DESC

--4B: Tabla temporal con los 10 productos mas vendidos en el ultimo mes
SELECT TOP 10 p.nombre, COUNT(p.id_producto) 'CantidadVentas'
INTO #productos_mas_vendidos
FROM ventas v
INNER JOIN productos p ON v.id_producto = p.id_producto
WHERE fecha_venta >= DATEADD(MONTH, -3, GETDATE())
GROUP BY p.nombre
ORDER BY CantidadVentas

SELECT * FROM #productos_mas_vendidos