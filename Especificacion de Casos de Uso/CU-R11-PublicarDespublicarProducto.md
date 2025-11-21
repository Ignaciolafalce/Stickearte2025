# CU-R11 – Publicar / Despublicar Producto
**Estado:** En desarrollo  
**Versión:** 1.4

---

## 1. Descripción
Caso de uso reutilizable que permite cambiar el estado de publicación de un Producto.  
Garantiza la consistencia entre el flag `Producto.Publicado` y la entidad `Publicación` (`Publicación.Estado`), creando la `Publicación` si no existe y preservando los datos asociados (comentarios, favoritos, historial). Es invocado desde pantallas de administración, creación/edición de producto y otras áreas que permitan publicar/despublicar.

---

## 2. Actor Principal
- Diseñador (propietario del producto)  
- Administrador

---

## 3. Precondiciones
- El actor está autenticado.  
- El actor es el propietario del Producto o tiene rol Administrador.  
- El Producto existe y no está borrado lógicamente.  
- (Opcional) Si la `Publicación` no existe, el CU la creará en estado *Oculto* como paso de recuperación.

---

## 4. Flujo Normal

1. El actor accede a la UI de gestión del Producto y cambia el switch **“Publicado”** (ON → publicar / OFF → despublicar), o selecciona la acción equivalente (botón publicar/despublicar).
2. El sistema recibe la solicitud con:
   - `ProductoId`
   - `Action` = `Publish` | `Unpublish`
   - `ActorId`
3. El sistema verifica permisos (propietario o Admin).  
   - Si no tiene permisos → FLUJO A1.
4. El sistema carga el `Producto` y la `Publicación` asociada (si existe).
5. Si no existe `Publicación` asociada:
   - Se crea una nueva `Publicación` vinculada al `Producto` con `Estado = Oculto` y se guarda el `PublicacionId` en el `Producto`. (Registro de auditoría: creación de publicación por fallback.)
6. Dependiendo de la `Action` solicitada:
   - **Publish**:
     1. El sistema verifica que existan los assets necesarios (imagen generada y miniatura).  
        - Si faltan assets → aplicar A2 (no se publica; notificar).  
     2. Actualiza `Publicacion.Estado = Visible`.  
     3. Actualiza `Producto.Publicado = true`.  
   - **Unpublish**:
     1. Actualiza `Publicacion.Estado = Oculto`.  
     2. Actualiza `Producto.Publicado = false`.
7. El sistema registra auditoría: `{ProductoId, PublicacionId, ActorId, Action, Timestamp}`.
8. Persiste cambios en la BD dentro de una transacción atómica (si la DB no soporta transacciones multi-table, aplicar compensación).  
9. Devuelve resultado al actor y actualiza la UI (mensaje: “Producto publicado” / “Producto despublicado”).
10. Finaliza el caso de uso.

---

## 5. Flujos Alternativos

### A1 – Actor sin permisos
1. En el paso 3, la verificación de permisos falla.  
2. El sistema bloquea la operación y muestra: *“No tiene permisos para modificar la publicación de este producto.”*  
3. Finaliza sin cambios.

### A2 – Assets faltantes para publicar
1. En el paso 6 (Publish), el sistema detecta ausencia de imagen generada o miniatura.  
2. El sistema no permite publicar y muestra: *“No se puede publicar: faltan assets (vista previa o miniatura).”*  
3. El actor puede reintentar tras generar los assets.  
4. Finaliza sin cambios.

### A3 – Publicación ya en el estado solicitado
1. Si la `Publicacion.Estado` ya coincide con la `Action` solicitada (por ejemplo, ya está `Visible` y se pide `Publish`), el sistema informa: *“El producto ya está publicado.”* y no realiza cambios.  
2. Finaliza.

### A4 – Conflicto de sincronización concurrente
1. Si otra operación cambia el estado entre la lectura y el commit, la transacción detecta conflicto.  
2. El sistema rehace la lectura o informa al usuario de que reintente.  
3. Finaliza con resultado de retry o error según política.

---

## 6. Excepciones del Sistema
- **E1 – Error al persistir cambios:** revertir transacción y mostrar mensaje genérico.  
- **E2 – Error de integridad:** inconsistencias detectadas entre `Producto` y `Publicación`. Registrar y alertar.  
- **E3 – Timeout/caída del servicio de assets**: no publicar, registrar incidente y notificar al usuario.

---

## 7. Postcondiciones
- `Producto.Publicado` y `Publicacion.Estado` quedan sincronizados:  
  - `Producto.Publicado = true` ⇔ `Publicacion.Estado = Visible`  
  - `Producto.Publicado = false` ⇔ `Publicacion.Estado = Oculto`
- Si fue necesario, se creó una `Publicación` en estado *Oculto* y quedó enlazada al `Producto`.
- Auditoría de la operación registrada.

---

## 8. Puntos de Inclusión
- Puede invocarse desde:
  - **CU-R9 – Crear Producto desde Diseño** (opcional: publicar al finalizar creación)  
  - **CU2.3 – Editar Producto** (cuando el usuario cambia el switch)  
  - **CU2.1 – Listar/Buscar Productos** (acción rápida en el listado)  
  - Otras pantallas administrativas

---

## 9. Puntos de Extensión
- Ninguno

---

## 10. Requisitos Relacionados
- **RF22 – Gestionar publicación de productos**  
- **RF23 – Establecer visibilidad en publicaciones**  
- **RF05 – Validación de assets antes de publicar**  
- **RF15 – Auditoría de operaciones críticas**
