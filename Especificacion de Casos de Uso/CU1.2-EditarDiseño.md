# CU1.2 – Editar Diseño
**Estado:** En desarrollo  
**Versión:** 1.3  

---

## 1. Descripción
Permite que el Diseñador modifique los datos de un diseño previamente creado:  
título, descripción, categoría, visibilidad, tags y, opcionalmente, la imagen principal (lo que dispara la regeneración de la miniatura como caso de uso reutilizable).  

La pantalla también muestra los **productos asociados al diseño**, permitiendo navegar a la edición de cada uno (CU2.3).

---

## 2. Actor Principal
- Diseñador

---

## 3. Precondiciones
- El usuario debe estar autenticado con rol Diseñador.  
- El diseño debe existir y pertenecer al usuario.  
- El diseño no debe estar eliminado lógicamente.

---

## 4. Flujo Normal

1. El Diseñador selecciona un diseño para editar desde **Listar/Buscar Diseños**  
   → *CU1.4 (extend)*.

2. El sistema carga los datos actuales del diseño:  
   - Título  
   - Descripción  
   - Categoría  
   - Visibilidad  
   - Tags  
   - Imagen actual + Miniatura

2.b. El sistema muestra la sección **“Productos creados desde este Diseño”**, con una tabla que incluye por cada producto:  
   - Imagen miniatura  
   - **Título del producto**  
   - **Comisión**  
   - **Precio Final**  
   - Botón **Editar Producto**

3. El Diseñador modifica uno o varios campos del formulario.

4. Si modifica los **tags**, el sistema permite:  
   - Autocompletar desde tags existentes  
   - Crear nuevos tags  
   - Eliminar tags actuales  
   *(se requiere mínimo 3 tags para guardar)*

5. El Diseñador opcionalmente selecciona una **nueva imagen** desde su dispositivo.

6. El sistema valida preliminarmente la imagen  
   → *CU-R1 Validar Imagen (include)*.

7. Si la imagen es válida, el sistema permite la carga y reemplazo.

8. El sistema genera automáticamente una nueva miniatura  
   → *CU-R2 Generar Thumbnail (include)*.

8.b. Si el Diseñador hace clic en **Editar Producto** sobre un item de la lista de productos asociados,  
     el sistema ejecuta **CU2.3 – Editar Producto (extend)**.

9. El Diseñador hace clic en **Guardar cambios**.

10. El sistema valida los datos:  
    - Título no vacío  
    - Categoría seleccionada  
    - Mínimo 3 tags  
    - Visibilidad válida  

11. El sistema guarda las modificaciones en la base de datos.  

12. El sistema actualiza la fecha de última modificación.  

13. El sistema muestra un mensaje de confirmación:  
    **“Diseño actualizado correctamente”**.

14. El sistema retorna a la vista de detalles o lista de diseños, según la navegación de la pantalla.

---

## 5. Flujos Alternativos

### A1 – Reemplazo de imagen cancelado
1. El Diseñador selecciona una imagen nueva pero cancela.  
2. El sistema mantiene la imagen previa.  
3. Retorna al paso 3 del Flujo Normal.

---

### A2 – Usuario hace clic en “Descartar cambios”
1. El Diseñador cancela la edición.  
2. El sistema descarta los cambios.  
3. Retorna a la lista de diseños.

---

### A3 – Validación fallida
1. El sistema detecta errores (p. ej.: título vacío, sin tags, etc.).  
2. Se muestran mensajes de error sobre los campos correspondientes.  
3. El Diseñador corrige los datos.  
4. Retorna al paso 3 del Flujo Normal.

---

## 6. Excepciones del Sistema

### E1 – Imagen corrupta o no procesable  
- El sistema cancela el reemplazo.  
- Notifica el error.  
- Mantiene la imagen anterior.

### E2 – Error al guardar cambios  
- Se muestra un mensaje de error.  
- El sistema mantiene los datos ingresados en el formulario.  
- Permite reintentar.

---

## 7. Postcondiciones
- El diseño queda actualizado con los datos ingresados.  
- Si se actualizó la imagen, la miniatura también fue regenerada.  
- Se registra la fecha de actualización.  

---

## 8. Puntos de Inclusión (include)
- **CU-R1 – Validar Imagen**  
- **CU-R2 – Generar Thumbnail**

---

## 9. Puntos de Extensión (extend)
- **CU2.3 – Editar Producto** *(desde la lista de productos generados por este diseño)*  
- *(Otros CU extendidos no aplican para este caso)*

---

## 10. Requisitos Relacionados
- **RF06 – Gestión de Diseños**  
- **RF04 – Validación de imágenes**  
- **RF05 – Generación de miniaturas**
