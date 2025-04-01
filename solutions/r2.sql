-- Análisis de Clientes Frecuentes
WITH total_cliente AS (
    SELECT
        c.id_cliente,
        c.nombre,
        c.segmento,
        c.pais,
        COUNT(cp.id_compra) AS total_compras,
        SUM(cp.monto) AS monto_total,
        AVG(cp.monto) AS promedio_compra,
        MIN(cp.fecha_compra) AS primera_compra,
        MAX(cp.fecha_compra) AS ultima_compra,
        JULIANDAY(MAX(cp.fecha_compra)) - JULIANDAY(MIN(cp.fecha_compra)) AS dias_actividad
    FROM clientes c
    JOIN compras cp ON c.id_cliente = cp.id_cliente
    GROUP BY c.id_cliente, c.nombre, c.segmento, c.pais
),
percentiles AS (
    SELECT 
        id_cliente,
        PERCENT_RANK() OVER (ORDER BY monto_total DESC) AS percentil
    FROM total_cliente
)
SELECT
    tc.nombre,
    tc.segmento,
    tc.pais,
    tc.total_compras,
    tc.monto_total,
    tc.promedio_compra,
    tc.primera_compra,
    tc.ultima_compra,
    tc.dias_actividad
FROM total_cliente tc
JOIN percentiles p ON tc.id_cliente = p.id_cliente
WHERE p.percentil <= 0.2  -- Top 20%
ORDER BY tc.monto_total DESC; 
