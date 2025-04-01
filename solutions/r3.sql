-- Análisis de Rentabilidad de Productos por Proveedor
WITH productos_stats AS (
    SELECT
        proveedor,
        categoria,
        COUNT(*) AS num_productos,
        SUM(precio * stock) AS valor_inventario,
        AVG(precio) AS precio_promedio,
        MAX(precio) AS precio_maximo,
        MIN(precio) AS precio_minimo,
        MAX(nombre) FILTER (WHERE precio = MAX(precio) OVER (PARTITION BY proveedor, categoria)) AS producto_mas_caro,
        MAX(nombre) FILTER (WHERE precio = MIN(precio) OVER (PARTITION BY proveedor, categoria)) AS producto_mas_barato
    FROM productos
    GROUP BY proveedor, categoria
)
SELECT
    proveedor,
    categoria,
    num_productos,
    valor_inventario,
    precio_promedio,
    producto_mas_caro,
    producto_mas_barato,
    precio_maximo - precio_minimo AS diferencia_precio
FROM productos_stats
ORDER BY proveedor, valor_inventario DESC; 
