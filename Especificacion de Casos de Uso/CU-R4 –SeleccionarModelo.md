# CU-R4 – Seleccionar Modelo
**Estado:** En desarrollo  
**Versión:** 1.3  

---

## 1. Descripción
Caso de uso reutilizable que permite al Diseñador seleccionar un **Modelo** (taza, remera, sticker, etc.) para asociarlo a un Producto.  
Se utiliza en la creación de productos derivados de un Diseño (**CU-R9 – Crear Producto desde Diseño**) o en cualquier funcionalidad futura que requiera elegir un modelo preexistente.

Este CU presenta al usuario un listado filtrable de Modelos, permite buscarlos por nombre o tipo, y retorna el **ModeloId** seleccionado.

---

## 2. Actor Principal
- Diseñador  
- Administrador (opcional, para gestión interna)

---

## 3. Precondiciones
- El usuario debe estar autenticado.  
- Deben existir Modelos precargados en el sistema.  
- Los Modelos no deben estar dados de baja lógica.  
- El CU llamador debe proveer el contexto para recibir el Modelo seleccionado.

---

## 4. Flujo Normal

1. El CU llamador solicita la selección de un Modelo (por ejemplo, **CU-R9 – Crear Producto desde Diseño**).
2. El sistema muestra una ventana/modal/listado con:
   - Miniatura del Modelo  
   - Nombre  
   - Tipo (taza, remera, sticker…)  
   - Descripción breve  
   - Costo base  
   - Botones: **Seleccionar**, **Cancelar**
   - Barra de búsqueda por nombre  
   - Filtro por tipo de modelo
3. El usuario filtra por tipo o ingresa texto en la búsqueda.
4. El sistema actualiza el listado de Modelos aplicando los filtros.
5. El usuario selecciona un Modelo presionando **“Seleccionar”**.
6. El sistema valida:
   - El Modelo existe  
   - No está dado de baja lógica  
   - Es seleccionable en el contexto actual
7. El sistema retorna:
   - `ModeloId`  
   - `Nombre`, `Tipo`  
   - `CostoBase`  
   - `MockupImageId` y `MiniaturaId`
8. Retorna al CU llamador para continuar el flujo principal.

---

## 5. Flujos Alternativos

### A1 – Sin resultados en la búsqueda
1. En el paso 4, la lista queda vacía.  
2. El sistema muestra mensaje: *“No se encontraron modelos con esos criterios.”*  
3. Retorna al paso 3.

---

### A2 – Modelo no seleccionable
(Ocurre si un modelo fue dado de baja justo en el momento de selección)

1. En el paso 6, el sistema detecta que el Modelo no está disponible.  
2. Muestra mensaje: *“El modelo seleccionado ya no está disponible.”*  
3. Retorna al paso 2.

---

### A3 – El usuario cancela la selección
1. El usuario presiona **Cancelar**.  
2. El sistema notifica al CU llamador.  
3. Retorna sin Modelo seleccionado.  
4. El CU llamador decide cómo continuar (generalmente vuelve a la pantalla anterior).

---

## 6. Excepciones del Sistema
- **E1 – Error de conexión al cargar Modelos**  
- **E2 – Error al cargar miniaturas/mocks**  
- **E3 – Timeout en búsqueda/filtrado**

---

## 7. Postcondiciones
- Se devuelve al CU llamador un Modelo válido.  
- El CU llamador continúa con la creación o edición del Producto.  
- No se persiste ningún dato desde este CU (solo devuelve selección).

---

## 8. Puntos de Inclusión
- Utilizado desde:
  - **CU-R9 – Crear Producto desde Diseño**  
  - Futuras funcionalidades con selección de Modelos

---

## 9. Puntos de Extensión
- Ninguno

---

## 10. Requisitos Relacionados
- **RF07 – Seleccionar modelo para crear producto**  
- **RF10 – Buscar y filtrar modelos disponibles**  
