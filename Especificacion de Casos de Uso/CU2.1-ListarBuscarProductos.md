# CU2.1 – Listar / Buscar Productos
**Estado:** En desarrollo  
**Versión:** 1.1  

---

## 1. Descripción
Permite al Diseñador visualizar todos sus productos, buscar por título y aplicar filtros
por modelo y estado de publicación.  
Desde este listado el usuario puede editar, eliminar, publicar/despublicar y exportar la información.

---

## 2. Actor Principal
- Diseñador

---

## 3. Precondiciones
- El usuario debe estar autenticado con rol Diseñador.
- Deben existir productos creados o disponibles para listar.

---

## 4. Flujo Normal
1. El Diseñador accede a **Productos → Listar/Buscar**.
2. El sistema muestra un listado con:
   - Miniatura  
   - Título  
   - Modelo  
   - Precio final  
   - Comisión  
   - Estado (Publicado / No publicado)  
   - Acciones: **Editar**, **Eliminar**, **Publicar/Despublicar**
3. El sistema muestra controles de búsqueda y filtrado:
   - **Buscar por título**
   - **Filtrar por modelo**
   - **Filtrar por estado:** Publicado / No publicado
4. El Diseñador ingresa texto o selecciona filtros.
5. El sistema actualiza el listado en tiempo real.
6. El Diseñador puede realizar:
   - **Editar Producto** → CU2.3  
   - **Eliminar Producto** → CU2.4  
   - **Publicar/Despublicar** → CU-R11  
   - **Exportar Datos** → CU-T1  
7. El caso de uso finaliza.

---

## 5. Flujos Alternativos

### A1 – No existen productos
1. El sistema detecta que el usuario no tiene productos creados.
2. Muestra: **“Aún no tienes productos creados.”**
3. Ofrece botón: **“Crear Producto”** (deriva a CU2.2).
4. Finaliza.

### A2 – Búsqueda sin resultados
1. El usuario aplica filtros o un término de búsqueda.
2. El sistema no encuentra coincidencias.
3. Muestra: **“No se encontraron productos con los criterios aplicados.”**
4. Permite ajustar filtros y retorna al paso 3.

---

## 6. Excepciones del Sistema
- **E1 – Error al cargar el listado**
- **E2 – Error al aplicar filtros**

---

## 7. Postcondiciones
- Se muestra el listado según búsqueda y filtros aplicados.
- El Diseñador puede operar sobre cada producto.

---

## 8. Puntos de Inclusión
- **CU2.3 – Editar Producto**
- **CU2.4 – Eliminar Producto**
- **CU-T1 – Exportar Datos**

---

## 9. Puntos de Extensión
- **CU-R11 – Publicar/Despublicar Producto**

---

## 10. Requisitos Relacionados
- **RF10 – Listar productos**
- **RF08 – Editar productos**
- **RF09 – Publicar/Despublicar productos**
- **RF14 – Exportación**
