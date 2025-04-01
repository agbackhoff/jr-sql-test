# SQL Exam - Junior Level

Este repositorio contiene un examen de SQL de nivel junior con 3 preguntas. El examen está diseñado para evaluar tus conocimientos básicos y prácticos de SQL usando PostgreSQL.

## Estructura del Repositorio

```
.
├── README.md
├── requirements.txt
└── solutions/
    ├── r1.sql  # Respuesta a la pregunta 1 (debes crear este archivo)
    ├── r2.sql  # Respuesta a la pregunta 2 (debes crear este archivo)
    └── r3.sql  # Respuesta a la pregunta 3 (debes crear este archivo)
```

## Instrucciones para Contestar el Examen

1. Haz un fork de este repositorio
2. Clona tu fork localmente
3. Configura un entorno virtual (recomendado):
   ```bash
   python -m venv venv
   source venv/bin/activate  # En Windows: venv\Scripts\activate
   pip install -r requirements.txt
   ```
4. En la carpeta `solutions/`, crea tres archivos:
   - `r1.sql` para la primera pregunta
   - `r2.sql` para la segunda pregunta
   - `r3.sql` para la tercera pregunta
5. Escribe tu respuesta SQL en cada archivo correspondiente
6. Haz commit de tus cambios
7. Crea un Pull Request al repositorio original

## Sistema de Evaluación

Tu solución se evaluará automáticamente cuando crees el Pull Request, y recibirás feedback sobre tus respuestas.

## Preguntas del Examen

### Pregunta 1: Análisis de Tendencias de Ventas por Región (Función de Ventana)
Dada una tabla `ventas` con las siguientes columnas:
- `id_venta` (INTEGER)
- `fecha` (TEXT)
- `categoria` (TEXT)
- `monto` (FLOAT)
- `region` (TEXT)

**Ejemplo de datos:**

| id_venta | fecha      | categoria    | monto   | region |
|----------|------------|--------------|---------|--------|
| 1        | 2024-01-02 | Ropa         | 110.0   | Norte  |
| 2        | 2024-01-03 | Electrónicos | 120.0   | Sur    |
| 3        | 2024-01-04 | Hogar        | 130.0   | Este   |
| 4        | 2024-01-05 | Ropa         | 140.0   | Oeste  |
| 5        | 2024-01-06 | Electrónicos | 150.0   | Centro |

Escribe una consulta SQL que muestre:
- La región
- La categoría
- El total de ventas por combinación de región y categoría
- El porcentaje que representa cada categoría dentro de su región
- El ranking de cada categoría dentro de su región (según monto total)

Ordena los resultados por región y ranking de manera ascendente.

**Output esperado similar a:**

| region | categoria    | total_ventas | porcentaje_region | ranking_region |
|--------|--------------|--------------|-------------------|----------------|
| Centro | Hogar        | 3690.0       | 35.1%             | 1              |
| Centro | Electrónicos | 3580.0       | 34.1%             | 2              |
| Centro | Ropa         | 3230.0       | 30.8%             | 3              |
| ...    | ...          | ...          | ...               | ...            |

### Pregunta 2: Análisis de Clientes Frecuentes (CTE/Subconsulta)
Dada una tabla `clientes` con las siguientes columnas:
- `id_cliente` (INTEGER)
- `nombre` (TEXT)
- `fecha_registro` (TEXT)
- `pais` (TEXT)
- `segmento` (TEXT)

**Ejemplo de datos:**

| id_cliente | nombre     | fecha_registro | pais     | segmento  |
|------------|------------|----------------|----------|-----------|
| 1          | Cliente 0  | 2023-01-31     | México   | Premium   |
| 2          | Cliente 1  | 2023-03-02     | España   | Regular   |
| 3          | Cliente 2  | 2023-04-01     | Colombia | Económico |
| ...        | ...        | ...            | ...      | ...       |

Y una tabla `compras` con:
- `id_compra` (INTEGER)
- `id_cliente` (INTEGER)
- `fecha_compra` (TEXT)
- `monto` (FLOAT)

**Ejemplo de datos:**

| id_compra | id_cliente | fecha_compra | monto |
|-----------|------------|--------------|-------|
| 1         | 1          | 2024-01-02   | 105.0 |
| 2         | 2          | 2024-01-03   | 110.0 |
| 3         | 3          | 2024-01-04   | 115.0 |
| ...       | ...        | ...          | ...   |

Escribe una consulta SQL que identifique a los "mejores clientes" y muestre:
- El nombre del cliente
- El segmento del cliente
- El país
- El número total de compras
- El monto total gastado
- El monto promedio por compra
- La fecha de su primera compra
- La fecha de su última compra
- Los días transcurridos entre la primera y última compra

Considera como "mejores clientes" aquellos que están en el 20% superior en términos de gasto total.

**Output esperado similar a:**

| nombre     | segmento | pais     | total_compras | monto_total | promedio_compra | primera_compra | ultima_compra | dias_actividad |
|------------|----------|----------|---------------|-------------|-----------------|----------------|---------------|----------------|
| Cliente 19 | Regular  | Colombia | 5             | 1575.0      | 315.0           | 2024-01-20     | 2024-04-09    | 80             |
| Cliente 18 | Premium  | Argentina| 5             | 1550.0      | 310.0           | 2024-01-19     | 2024-04-08    | 80             |
| ...        | ...      | ...      | ...           | ...         | ...             | ...            | ...           | ...            |

### Pregunta 3: Análisis de Rentabilidad de Productos por Proveedor
Dada una tabla `productos` con las siguientes columnas:
- `id_producto` (INTEGER)
- `nombre` (TEXT)
- `categoria` (TEXT)
- `precio` (FLOAT)
- `stock` (INTEGER)
- `proveedor` (TEXT)

**Ejemplo de datos:**

| id_producto | nombre         | categoria    | precio  | stock | proveedor   |
|-------------|----------------|--------------|---------|-------|-------------|
| 1           | iPhone 13 Pro  | Electrónicos | 999.99  | 10    | Proveedor A |
| 2           | Laptop Gaming  | Electrónicos | 1299.99 | 5     | Proveedor B |
| ...         | ...            | ...          | ...     | ...   | ...         |

Escribe una consulta SQL que muestre:
- El proveedor
- La categoría
- El número de productos
- El valor total del inventario (precio * stock)
- El precio promedio de los productos
- El producto más caro
- El producto más barato
- La diferencia de precio entre el producto más caro y el más barato

Ordena los resultados por proveedor y valor del inventario de manera descendente.

**Output esperado similar a:**

| proveedor   | categoria    | num_productos | valor_inventario | precio_promedio | producto_mas_caro | producto_mas_barato | diferencia_precio |
|-------------|--------------|---------------|------------------|-----------------|-------------------|---------------------|-------------------|
| Proveedor A | Electrónicos | 2             | 16399.82         | 899.99          | iPhone 13 Pro     | Smart TV 4K         | 200.0             |
| Proveedor A | Hogar        | 1             | 4499.85          | 299.99          | Mesa de Centro    | Mesa de Centro      | 0.0               |
| ...         | ...          | ...           | ...              | ...             | ...               | ...                 | ...               |

## Calificación

El examen se calificará automáticamente cuando crees un Pull Request. Cada pregunta tiene un valor de 10 puntos, para un total de 30 puntos. La puntuación mínima para aprobar es de 20 puntos.

## Requisitos

- Conocimientos de SQL intermedio (incluyendo funciones de ventana, CTEs y subconsultas)
- Git y GitHub
- Un editor de texto o IDE de tu preferencia
- Python 3.6+ (para pruebas locales)

## Tiempo Estimado

El examen está diseñado para completarse en aproximadamente 1 hora.

## Notas Importantes

- Las consultas deben ser eficientes y seguir las mejores prácticas de SQL
- No se permiten consultas que generen errores de sintaxis
- Para la primera pregunta, debes abordar el problema con agrupación y cálculos
- Para la segunda pregunta, debes usar CTEs o subconsultas

## Soporte

Si tienes alguna pregunta sobre el examen o encuentras algún problema, por favor abre un issue en el repositorio.