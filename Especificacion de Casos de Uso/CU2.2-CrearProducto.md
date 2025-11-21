# CU2.2 – Crear Producto
**Estado:** En desarrollo  
**Versión:** 1.1

---

## 1. Descripción
Permite al Diseñador iniciar la creación de un nuevo Producto seleccionando uno de sus Diseños ya existentes.  
Este caso de uso gestiona la selección del Diseño (vía CU-R3 – Seleccionar Diseño); la creación completa del Producto continúa mediante **CU-R9 – Crear Producto desde Diseño**.

---

## 2. Actor Principal
- Diseñador

---

## 3. Precondiciones
- El usuario debe estar autenticado como Diseñador.  
- Debe existir al menos un Diseño creado por el usuario (si no, el sistema ofrecerá subir uno).  
- El usuario debe tener permisos para gestionar Productos.

---

## 4. Flujo Normal
1. El Diseñador selecciona la opción **“Crear Producto”** desde el módulo de Productos.
2. El sistema inicia **CU-R3 – Seleccionar Diseño** (abre diálogo/picker).
3. Si CU-R3 retorna *cancelado*, el sistema vuelve a la pantalla de Productos y finaliza (A1).
4. Si CU-R3 retorna la referencia de un Diseño seleccionado, el sistema muestra resumen del Diseño elegido (miniatura, título, categoría).
5. El Diseñador confirma la selección pulsando **Continuar**.
6. El sistema verifica que exista la selección (si no, A2).
7. El sistema inicia **CU-R9 – Crear Producto desde Diseño**, enviando el Diseño seleccionado como input.
8. Finaliza el caso de uso.

---

## 5. Flujos Alternativos

### A1 – Selección cancelada
1. En el paso 3, si CU-R3 retorna *cancelado*, el sistema muestra la pantalla principal de Productos.  
2. No se crea producto.  
3. Fin del CU.

### A2 – Ningún diseño seleccionado al confirmar
1. En el paso 6, el sistema detecta que no hay diseño seleccionado.  
2. Muestra mensaje: “Debe seleccionar un diseño para continuar.”  
3. Retorna al paso 2.

### A3 – No hay diseños disponibles (delegado desde CU-R3)
1. CU-R3 detecta ausencia de diseños y retorna la opción de ir a **CU1.1 – Subir Diseño**.  
2. El usuario decide:  
   - Ir a CU1.1 → se inicia CU1.1  
   - O cancelar → se finaliza CU2.2

---

## 6. Excepciones del Sistema
- **E1 – Error al cargar los diseños**: mostrar mensaje y permitir reintentar.  
- **E2 – Error al invocar el selector**: mostrar mensaje y abortar el flujo.

---

## 7. Postcondiciones
- Se tiene un Diseño validado/seleccionado para iniciar la creación del Producto.  
- Se inicia **CU-R9 – Crear Producto desde Diseño** con el diseño seleccionado.

---

## 8. Puntos de Inclusión
- **Incluye**: **CU-R3 – Seleccionar Diseño**  
- **Incluye** / inicia: **CU-R9 – Crear Producto desde Diseño**

---

## 9. Puntos de Extensión
- Ninguno.

---

## 10. Requisitos Relacionados
- **RF10 – Crear productos a partir de diseños existentes**  
- **RF06 – Gestionar diseños**
