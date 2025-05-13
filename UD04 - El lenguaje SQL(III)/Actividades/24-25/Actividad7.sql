-- Crear un índice en la columna "nombre" de la tabla "clientes"
CREATE INDEX IX_Clientes_Nombre ON clientes (nombre);

-- Crear un índice en las columnas "id_cliente" y "id_producto" de la tabla "pedidos"
CREATE INDEX IX_Pedidos_Cliente_Producto ON pedidos (id_cliente, id_producto);

-- Crear un índice en la columna "precio" de la tabla "productos" con un nombre específico
CREATE INDEX IX_Productos_Precio ON productos (precio);

-- Crear un índice en la columna "fecha_nacimiento" de la tabla "clientes" con un filtro para limitar el rango de fechas indexadas
CREATE INDEX IX_Clientes_FechaNacimiento ON clientes (fecha_nacimiento) WHERE fecha_nacimiento BETWEEN '2024-01-01' AND '2024-12-31';

-- Crear un índice en las columnas "nombre" y "precio" de la tabla "productos" con un ordenamiento de nombre ascendente y de precio descendente
CREATE INDEX IX_Productos_Nombre_Precio ON productos (nombre ASC, precio DESC);