# CU1.3 – Eliminar Diseño
**Estado:** En desarrollo  
**Versión:** 1.0  

---

## 1. Descripción
Permite al Diseñador eliminar uno de sus diseños.  
La eliminación es lógica (BajaLogica = true) y evita que el diseño aparezca en listados o pueda usarse para crear productos nuevos.  
El sistema solicita confirmación antes de eliminar.

---

## 2. Actor Principal
- Diseñador

---

## 3. Precondiciones
- El usuario debe estar autenticado con rol Diseñador.  
- El diseño debe existir, pertenecer al usuario y no estar ya eliminado lógicamente.  
- El diseño no debe estar involucrado en operaciones críticas (no aplica en esta iteración).

---

## 4. Flujo Normal

1. El Diseñador selecciona la opción **“Eliminar”** sobre un diseño desde  
   **CU1.4 – Listar/Buscar Diseños (extend)**.

2. El sistema muestra un cuadro de diálogo de confirmación:  
   **“¿Deseás eliminar este diseño? Esta acción no afecta a los productos ya creados.”**  
   Botones: **Confirmar**, **Cancelar**.

3. El Diseñador pulsa **“Confirmar”**.

4. El sistema marca el diseño como eliminado lógicamente (`BajaLogica = true`).

5. El sistema confirma la operación:  
   **“Diseño eliminado correctamente.”**

6. El sistema actualiza automáticamente la lista de diseños.  
   El diseño eliminado ya no aparece en los resultados.

---

## 5. Flujos Alternativos

### A1 – Cancelación por parte del usuario
1. En el paso 2, el Diseñador pulsa **“Cancelar”**.  
2. El sistema cierra el cuadro de diálogo.  
3. No se realizan cambios.  
4. Retorna a la lista de diseños (**CU1.4**).

---

### A2 – Diseño no disponible (inconsistencia)
1. El sistema detecta que el diseño ya fue eliminado por otro proceso o no existe.  
2. Se muestra un mensaje de advertencia:  
   **“El diseño no está disponible.”**  
3. El sistema actualiza la lista.  
4. Fin del CU.

---

## 6. Excepciones del Sistema

### E1 – Error al actualizar el registro  
- El sistema muestra un mensaje de error.  
- El diseño no cambia de estado.  
- Se permite reintentar.

---

## 7. Postcondiciones
- El diseño queda marcado como eliminado lógicamente (`BajaLogica = true`).  
- No aparece en listados ni búsquedas.  
- Los productos previamente creados no se eliminan ni se modifican.  
- Es posible restaurarlo en una futura iteración (si se añade esa funcionalidad).

---

## 8. Puntos de Inclusión (include)
*(No aplica)*

---

## 9. Puntos de Extensión (extend)
- Invocado desde **CU1.4 – Listar/Buscar Diseños** como acción del listado.

---

## 10. Requisitos Relacionados
- **RF06 – Gestionar Diseños (listar, editar, eliminar)**
