# CU1.4 – Listar / Buscar Diseños
**Estado:** En desarrollo  
**Versión:** 1.2  

---

## 1. Descripción
Permite al Diseñador visualizar la lista de sus diseños, filtrarlos mediante búsqueda, categoría y visibilidad, y acceder a acciones sobre cada diseño (editar, eliminar, crear producto, exportar datos).  
Incluye soporte para lista vacía, sin resultados, filtrado combinado y acciones extendidas.

---

## 2. Actor Principal
- Diseñador

---

## 3. Precondiciones
- El usuario debe estar autenticado con rol Diseñador.  
- Deben existir diseños registrados o mostrarse la lista vacía.

---

## 4. Flujo Normal

1. El Diseñador ingresa a la sección **“Mis Diseños”**.
2. El sistema muestra la lista inicial de diseños del usuario.  
   Cada diseño incluye:  
   - Miniatura  
   - **Título**  
   - **Categoría**  
   - **Visibilidad** (Público / Privado / Unlisted)  
   - **Tags** asociados  
   - Fecha de creación  
   - Acciones: **Editar**, **Eliminar**, **Crear Producto**, **Exportar**
3. El sistema muestra los controles:  
   - Campo de búsqueda por texto  
   - Filtro por **Categoría**  
   - Filtro por **Visibilidad**  
   - Botón **Limpiar filtros**
4. El Diseñador ingresa texto en el buscador.  
   La búsqueda matchea por:  
   - Título  
   - Tags  
   - Categoría
5. El Diseñador aplica filtros opcionales:  
   - Selección de **una categoría**  
   - Selección de **una visibilidad**
6. El sistema aplica los criterios:  
   - Búsqueda por texto (match OR entre título/tags/categoría)  
   - Filtrado por categoría  
   - Filtrado por visibilidad  
   - Combinación simultánea de filtros mediante **AND**
7. El sistema actualiza la lista según los criterios seleccionados.
8. El Diseñador selecciona una acción para un diseño:  
   - **Editar Diseño** → *CU1.2 (extend)*  
   - **Eliminar Diseño** → *CU1.3 (extend)*  
   - **Crear Producto** → *CU-R9 (extend)*  
   - **Exportar Datos** → *CU-T1 (extend)*
9. El sistema ejecuta el caso de uso extendido correspondiente.

---

## 5. Flujos Alternativos

### A1 – Sin resultados
1. La búsqueda o filtros no encuentran coincidencias.  
2. El sistema muestra el mensaje **“No se encontraron diseños”**.  
3. El Diseñador puede modificar la búsqueda o limpiar filtros.  
4. Retorna al paso 3 o 4 del Flujo Normal.

---

### A2 – Limpieza de filtros
1. El Diseñador selecciona **“Limpiar filtros”**.  
2. El sistema restablece búsqueda, categoría y visibilidad.  
3. Se muestra nuevamente la lista completa.  
4. Retorna al paso 2 del Flujo Normal.

---

### A3 – Usuario sin ningún diseño cargado
1. El sistema detecta que el usuario no posee diseños.  
2. Muestra el mensaje **“Aún no subiste ningún diseño”**.  
3. Ofrece el botón **“Subir Diseño”** → *CU1.1*.  
4. Fin del CU.

---

## 6. Excepciones del Sistema

- **E1 – Error al cargar la lista:**  
  Se muestra mensaje de error y permite reintentar.

- **E2 – Error al aplicar filtros/búsqueda:**  
  Se restauran los filtros y se muestra la lista completa.

---

## 7. Postcondiciones
- La lista queda actualizada según los filtros aplicados.  
- El usuario puede continuar con cualquier acción disponible.

---

## 8. Puntos de Inclusión (include)
*(No aplica)*

---

## 9. Puntos de Extensión (extend)
- **CU1.2 – Editar Diseño**  
- **CU1.3 – Eliminar Diseño**  
- **CU-R9 – Crear Producto desde Diseño**  
- **CU-T1 – Exportar Datos**

---

## 10. Requisitos Relacionados
- **RF06 – Gestión de Diseños**  
- **RF14 – Exportación de información**
