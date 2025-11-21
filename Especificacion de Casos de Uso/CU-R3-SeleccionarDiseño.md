# CU-R3 – Seleccionar Diseño
**Estado:** En desarrollo  
**Versión:** 1.0

---

## 1. Descripción
Caso de uso reutilizable que permite al usuario seleccionar un diseño existente mediante un diálogo o componente selector (picker) con búsqueda y filtros. Devuelve la referencia (ID) del diseño seleccionado al CU llamador.

---

## 2. Actor Principal
- Diseñador (invocado por el CU llamador)

---

## 3. Precondiciones
- El usuario está autenticado con rol Diseñador.  
- Deben existir diseños cargados para seleccionar (si no, el CU llamador podrá redirigir a CU1.1 – Subir Diseño).

---

## 4. Flujo Normal
1. El CU llamador invoca el selector (CU-R3).
2. El sistema muestra el diálogo/panel con:  
   - Campo de búsqueda por título/nombre.  
   - Filtro por categoría.  
   - Filtro por visibilidad.  
   - Lista de resultados con miniatura, título y categoría.  
   - Paginación si corresponde.  
3. El usuario aplica búsqueda/filtros si lo desea.  
4. El sistema actualiza la lista de resultados.  
5. El usuario selecciona un diseño y pulsa **Continuar**.  
6. El sistema retorna al CU llamador la referencia (ID) del diseño seleccionado.  
7. Finaliza el CU-R3.

---

## 5. Flujos Alternativos

### A1 – No hay diseños disponibles
1. Al invocarse, el selector detecta que no existen diseños para el usuario.  
2. Muestra mensaje: “No posee diseños para seleccionar.”  
3. Ofrece opción: **Ir a Subir Diseño (CU1.1)** o **Cancelar**.  
4. Retorna al CU llamador con estado *cancelado* o *redirigir* según elección.

### A2 – Usuario cancela selección
1. El usuario cierra o cancela el diálogo.  
2. CU-R3 retorna *cancelado* al CU llamador.  
3. El CU llamador decide si aborta o muestra mensaje.

---

## 6. Excepciones del Sistema
- **E1 – Error al cargar listados** (BD / servicio): retornar error al CU llamador.  
- **E2 – Timeout en búsqueda/filtrado**: retornar error y permitir reintento.

---

## 7. Postcondiciones
- Si el usuario confirmó, el CU llamador recibe la referencia del diseño seleccionado.  
- Si canceló o no hay diseños, no se retorna referencia.

---

## 8. Puntos de Inclusión
- Invocado por: **CU2.2 – Crear Producto** (obligatorio en el flujo de selección).  
- Puede invocarse desde otros CU en futuras iteraciones (documentar cuando se añadan).

---

## 9. Puntos de Extensión
- Ninguno

---

## 10. Requisitos Relacionados
- **RF03 – Subir diseños**  
- **RF06 – Gestionar diseños (búsqueda / filtros)**
