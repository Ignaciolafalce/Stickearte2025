# CU2.4 – Eliminar Producto
**Estado:** En desarrollo  
**Versión:** 1.0  

---

## 1. Descripción
Permite al Diseñador eliminar un producto previamente creado.  
La eliminación es lógica (baja lógica) para permitir auditoría y evitar pérdida permanente
de información.  
Un producto no puede eliminarse si está publicado.

---

## 2. Actor Principal
- Diseñador

---

## 3. Precondiciones
- El usuario debe estar autenticado con rol Diseñador.
- El producto debe existir.
- El producto debe pertenecer al Diseñador.
- El producto **no debe estar publicado**.  
  *(Si está publicado, aplica flujo alternativo A1.)*

---

## 4. Flujo Normal
1. El Diseñador selecciona un producto del listado (**CU2.1 – Listar/Buscar Productos**).
2. El Diseñador presiona el botón **“Eliminar”**.
3. El sistema muestra un cuadro de confirmación:
   - *“¿Desea eliminar este producto? Esta acción puede revertirse desde el módulo de administración.”*
4. El Diseñador confirma la eliminación.
5. El sistema marca el producto con **baja lógica = true**.
6. El sistema registra la fecha y el usuario que realizó la eliminación (opcional).
7. El sistema actualiza el listado ocultando el producto eliminado.
8. El sistema muestra mensaje de éxito:
   - *“Producto eliminado correctamente.”*
9. El caso de uso finaliza.

---

## 5. Flujos Alternativos

### A1 – El producto está publicado
1. En el paso 2, el sistema detecta que el producto está **publicado**.
2. El sistema muestra mensaje:
   - *“No es posible eliminar un producto publicado. Despublica el producto antes de eliminarlo.”*
3. El Diseñador puede optar por ir a **CU-R11 – Publicar/Despublicar Producto**.
4. Retorna al listado (**CU2.1**).

---

### A2 – El usuario cancela la eliminación
1. En el paso 4, el Diseñador selecciona **Cancelar**.
2. El sistema cierra el cuadro de diálogo.
3. Retorna al paso 1 sin alterar el producto.

---

### A3 – Error del sistema al eliminar
1. En el paso 5 ocurre un error inesperado.
2. El sistema muestra:
   - *“No fue posible eliminar el producto. Intente nuevamente.”*
3. El sistema registra el incidente.
4. Retorna al listado sin eliminar el producto.

---

## 6. Excepciones del Sistema
- **E1 – Error de acceso a datos**  
- **E2 – Producto inexistente o inconsistente**  
- **E3 – Problemas de permisos o integridad**

---

## 7. Postcondiciones
- El producto queda marcado como eliminado (baja lógica = true).
- El producto deja de aparecer en los listados del Diseñador.
- No se eliminan imágenes ni recursos asociados.

---

## 8. Puntos de Inclusión
- **CU2.1 – Listar/Buscar Productos** (punto de entrada)
- (Opcional) **CU-R11 – Publicar/Despublicar Producto**  
  Para permitir corregir el estado si el producto está publicado.

---

## 9. Puntos de Extensión
- Ninguno.

---

## 10. Requisitos Relacionados
- **RF10 – Gestionar productos**
- **RF09 – Publicar / Despublicar productos**
