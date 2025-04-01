-- Análisis de Tendencias de Ventas por Región
WITH ventas_por_region_categoria AS (
    SELECT
        region,
        categoria,
        SUM(monto) AS total_ventas
    FROM ventas
    GROUP BY region, categoria
),
total_region AS (
    SELECT
        region,
        SUM(total_ventas) AS region_total
    FROM ventas_por_region_categoria
    GROUP BY region
)
SELECT
    vpc.region,
    vpc.categoria,
    vpc.total_ventas,
    ROUND((vpc.total_ventas * 100.0 / tr.region_total), 1) || '%' AS porcentaje_region,
    RANK() OVER (PARTITION BY vpc.region ORDER BY vpc.total_ventas DESC) AS ranking_region
FROM ventas_por_region_categoria vpc
JOIN total_region tr ON vpc.region = tr.region
ORDER BY vpc.region, ranking_region ASC; 
