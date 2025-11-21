# CU2.3 – Editar Producto
**Estado:** En desarrollo  
**Versión:** 1.0

---

## 1. Descripción
Permite al Diseñador modificar un Producto ya existente.  
El Diseño y el Modelo asociados **no pueden cambiarse** en este caso de uso.  
El usuario puede actualizar la descripción, la comisión, el precio final, la visibilidad (publicado/no publicado), y regenerar la imagen del producto si corresponde.  
El caso de uso invoca CU-R5, CU-R8, CU-R2 y CU-R11 según las acciones realizadas.

---

## 2. Actor Principal
- Diseñador (propietario del producto)

---

## 3. Precondiciones
- El usuario debe estar autenticado con rol Diseñador.  
- El Producto debe existir y pertenecer al Diseñador (o el usuario debe ser Administrador).  
- El Producto no debe estar dado de baja lógica.  
- El Diseño y el Modelo asociados deben existir.  
- Debe existir una **Publicación** asociada al Producto (si no existe, se inicializa mediante CU-R11 durante el caso de uso).

---

## 4. Flujo Normal

1. El Diseñador selecciona un Producto para editar (**CU2.1 – Listar/Buscar Productos → Editar**).

2. El sistema muestra la pantalla de edición con las siguientes secciones:

   **Sección Diseño (read-only)**  
   - Miniatura del diseño  
   - Título, categoría, formato, medidas, tags  

   **Sección Modelo (read-only)**  
   - Miniatura del modelo  
   - Nombre del modelo, tipo, costo base  

   *(El modelo NO puede cambiarse en edición.)*

   **Información general**  
   - Título (autogenerado — solo lectura)  
   - Descripción (editable, obligatorio)

   **Información sobre precio**  
   - Costo base (read-only)  
   - Comisión (%) (editable mediante slider/input)  
   - Comisión ($) (calculada con **CU-R8**)  
   - Precio final = costo base + comisión  

   **Estado de publicación**  
   - Switch “Publicado” (true/false)

   **Vista previa**  
   - Imagen actual generada  
   - Datos principales del producto  

3. El Diseñador modifica la descripción y/o la comisión (%).

4. El sistema recalcula automáticamente comisión ($) y precio final utilizando:  
   - **CU-R8 – Calcular Precio / Comisión**

5. Si el cambio de comisión o descripción afecta a la presentación del producto, el Diseñador puede solicitar “Regenerar Vista Previa”.  
   - El sistema invoca **CU-R5 – Generar Vista Previa**.  
   - Si la vista previa se genera correctamente, se reemplaza la imagen actual.  
   - Luego se invoca **CU-R2 – Generar Thumbnail** para actualizar la miniatura.

6. El Diseñador marca o desmarca el switch “Publicado” según lo desee.

7. El Diseñador presiona **Guardar Cambios**.

8. El sistema valida los datos:
   - Descripción no vacía  
   - Comisión válida  
   - Vista previa válida (en caso de estar pendiente, aplicar A3)  

9. El sistema persiste los cambios del Producto:
   - Descripción  
   - Comisión  
   - Comisión($)  
   - PrecioFinal  
   - ImagenGeneradaId (si se regeneró)  
   - ImagenGeneradaMiniaturaId (si se regeneró)

10. El sistema invoca **CU-R11 – Publicar/Despublicar Producto** para sincronizar:  
    - `Producto.Publicado`  
    - `Publicacion.Estado`  

11. El sistema muestra mensaje **“Producto actualizado correctamente”**.

12. El Diseñador vuelve al listado de productos (**CU2.1 – Listar/Buscar Productos**).

---

## 5. Flujos Alternativos

### A1 – Validación fallida
1. En el paso 8, la descripción está vacía o la comisión fuera de rango.  
2. El sistema muestra mensajes de error.  
3. Retorna al paso 3.

---

### A2 – Error al regenerar vista previa
1. En el paso 5, falla CU-R5 (problema técnico o de imagen).  
2. El sistema muestra mensaje de fallo y mantiene la imagen actual.  
3. El Diseñador puede volver a intentar.  
4. Retorna al paso 3.

---

### A3 – Vista previa pendiente
(Para sistemas donde la generación es asíncrona)

1. En el paso 8, la vista previa aún no finalizó.  
2. El sistema prohíbe publicar el producto hasta que la imagen esté lista.  
3. Permite guardar cambios, pero **Publicado = false** aunque el usuario haya marcado TRUE.  
4. Notifica al usuario.  
5. Retorna al paso 9.

---

### A4 – Error al actualizar publicación
1. En el paso 10, CU-R11 falla (problema de permisos o error interno).  
2. El sistema guarda el Producto pero deja la Publicación en estado anterior.  
3. Se informa al Diseñador.  
4. Retorna al paso 11.

---

## 6. Excepciones del Sistema
- E1 – Error de base de datos  
- E2 – Error de almacenamiento de imágenes  
- E3 – Error en el motor de composición (CU-R5)  
- E4 – Error de sincronización con Publicación (CU-R11)

---

## 7. Postcondiciones
- El Producto queda actualizado con los nuevos valores.  
- Si se regeneró la vista previa, se actualizan la imagen generada y la miniatura.  
- La Publicación queda sincronizada con el estado “Publicado” del Producto.  
- El Producto aparece actualizado en la lista del Diseñador.

---

## 8. Puntos de Inclusión
- **CU-R5 – Generar Vista Previa**  
- **CU-R8 – Calcular Precio / Comisión**  
- **CU-R2 – Generar Thumbnail**  
- **CU-R11 – Publicar/Despublicar Producto**

---

## 9. Puntos de Extensión
- Ninguno

---

## 10. Requisitos Relacionados
- RF08 – Editar productos  
- RF05 – Generar miniaturas  
- RF11 – Generar vista previa del producto  
- RF09 – Publicar/Despublicar productos  
