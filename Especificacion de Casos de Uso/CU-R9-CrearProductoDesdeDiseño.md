# CU-R9 – Crear Producto desde Diseño
**Estado:** En desarrollo  
**Versión:** 2.0  

---

## 1. Descripción
Caso de uso reutilizable que permite **crear un Producto a partir de un Diseño existente**, seleccionando un modelo, completando información general y definiendo el precio final mediante el cálculo automático de comisión.

El sistema genera la **vista previa**, calcula el **precio final**, y crea automáticamente una **Publicación asociada** al producto (inicialmente con estado “No publicado”).

Es invocado principalmente por:
- **CU2.2 – Crear Producto** (selecciona un diseño → luego incluye este CU)
- También podría ser usado por procesos asistidos en el futuro.

---

## 2. Actor Principal
- **Diseñador**

---

## 3. Precondiciones
- El Diseñador debe estar autenticado.  
- El Diseñador debe tener permisos para crear productos.  
- El Diseño debe existir y pertenecer al Diseñador.  
- El CU llamador debe proveer:  
  - `DiseñoId`  
  - Imagen(s) del diseño (o acceso a ellas)  

---

## 4. Flujo Normal

1. El sistema recibe desde el CU llamador el `DiseñoId`.
2. El sistema muestra la sección **Datos del Diseño**:
   - Miniatura  
   - Título  
   - Categoría  
   - Formato  
   - Medidas  
   - Tags  
3. El sistema muestra la sección **Seleccionar Modelo**.
4. El Diseñador selecciona un Modelo → **include CU-R4 – Seleccionar Modelo**.
5. El sistema obtiene:
   - Imagen del modelo  
   - Datos del modelo (nombre, costo base, categoría, medidas, etc.)
6. El sistema genera la **vista previa inicial** del producto  
   → **include CU-R5 – Generar Vista Previa**.
7. El sistema muestra la sección **Información General**:
   - Título (autogenerado: *Modelo + Diseño*)  
   - Descripción (obligatoria)
8. El Diseñador completa la Descripción.
9. El sistema muestra la sección **Precio**:
   - Costo base  
   - Porcentaje de comisión  
   - Comisión en pesos  
   - Precio final  
10. El Diseñador ajusta el % de comisión.  
11. El sistema recalcula:  
    → **include CU-R8 – Calcular Precio / Comisión**.  
12. El sistema actualiza la vista previa con:
    - Título  
    - Precio final  
    - Tags  
    - Imagen generada  
13. El Diseñador selecciona el estado inicial de la publicación:  
    - Publicado (true)  
    - No publicado (false)  
14. El Diseñador pulsa **Guardar Producto**.
15. El sistema valida:
    - Modelo seleccionado  
    - Descripción no vacía  
    - Comisión válida  
16. El sistema genera la **miniatura** del producto  
    → **include CU-R2 – Generar Thumbnail**.
17. El sistema crea el **Producto** y su **Publicación asociada** (estado según selección del paso 13).
18. El sistema confirma la creación.  
19. Retorna al CU llamador (por ejemplo, CU2.2) que vuelve al listado de productos.

---

## 5. Flujos Alternativos

### A1 – Falta seleccionar modelo
1. En el paso 15 el sistema detecta que no hay modelo seleccionado.  
2. Muestra mensaje: *“Debe seleccionar un modelo para crear el producto.”*  
3. Retorna al paso 4.

---

### A2 – Descripción vacía
1. El Diseñador presiona Guardar sin completar descripción.  
2. El sistema muestra mensaje de error.  
3. Retorna al paso 8.

---

### A3 – Comisión inválida
1. En el paso 11 CU-R8 devuelve error por porcentaje fuera de rango.  
2. El sistema muestra mensaje.  
3. Retorna al paso 10.

---

### A4 – Error en la vista previa
1. CU-R5 falla al generar la superposición.  
2. El sistema muestra mensaje: *“No se pudo generar la vista previa.”*  
3. Permite reintentar desde el paso 6.  

---

### A5 – Error al generar la miniatura
1. CU-R2 falla.  
2. El sistema no crea el producto.  
3. Muestra error y finaliza.

---

## 6. Excepciones del Sistema
- **E1 – Error al cargar datos del modelo**  
- **E2 – Fallas en recursos gráficos**  
- **E3 – Problemas al crear la publicación inicial**  
- **E4 – Error de almacenamiento del producto**  

---

## 7. Postcondiciones
- Se crea un Producto nuevo asociado a un Diseño.  
- Se almacena la miniatura del producto.  
- Se genera o actualiza la imagen de vista previa.  
- Se crea una **Publicación** asociada, con estado Publicado/No Publicado según selección.  
- El producto aparece en el listado del Diseñador.

---

## 8. Puntos de Inclusión
- **CU-R4 – Seleccionar Modelo**  
- **CU-R5 – Generar Vista Previa**  
- **CU-R8 – Calcular Precio / Comisión**  
- **CU-R2 – Generar Thumbnail**

---

## 9. Puntos de Extensión
- Ninguno (la extensión ocurrirá en casos mayores como “Editar Producto”).

---

## 10. Reglas de Negocio Asociadas
- **RN-CP1 – Rango de comisión permitido (0%–50%)**  
- **RN-P1 – El modelo no puede cambiar una vez creado el Producto**  
- **RN-P2 – Un Producto siempre tiene una Publicación asociada**  
- **RN-P3 – El título del producto es generado automáticamente**  
- **RN-P4 – El precio final debe ser >= costo base**

---

## 11. Requisitos Relacionados
- **RF09 – Crear Productos**  
- **RF10 – Cálculo de precio**  
- **RF11 – Miniaturas de producto**  
- **RF12 – Publicar / Despublicar producto**  
