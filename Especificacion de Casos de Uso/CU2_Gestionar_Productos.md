# CU2 – Gestionar Productos
**Estado:** En desarrollo  
**Versión:** 1.0  

---

## 1. Descripción
Caso de uso core que permite al Diseñador administrar los Productos derivados de sus Diseños.  
Incluye la posibilidad de listar, buscar, crear, editar y eliminar productos.  
Extiende e incluye múltiples casos de uso reutilizables relacionados con la selección de modelos, generación de vista previa, cálculo de precio/comisión y publicación.

---

## 2. Actor Principal
- **Diseñador**

---

## 3. Precondiciones
- El usuario debe estar autenticado con rol Diseñador.
- Debe existir al menos un Diseño previamente creado.
- Para crear o editar productos deben existir Modelos activos.
- El sistema debe permitir el acceso al módulo de productos.

---

## 4. Flujo Normal
1. El Diseñador ingresa a la sección **“Productos”**.
2. El sistema muestra la vista principal del módulo, que incluye:
   - Botón **“Crear Producto”**
   - Listado de productos (invoca **CU2.1 – Listar/Buscar Productos**)  
   - Filtros básicos: Modelo, Estado de publicación
3. El Diseñador puede realizar alguna de las siguientes acciones:
   - **Crear producto** → invoca **CU2.2 – Crear Producto**
   - **Editar producto** → invoca **CU2.3 – Editar Producto**
   - **Eliminar producto** → invoca **CU2.4 – Eliminar Producto**
   - **Exportar listado** → invoca **CU-T1 – Exportar Datos**
4. El sistema responde ejecutando el caso de uso correspondiente.
5. El Diseñador continúa gestionando productos según necesidad.

---

## 5. Flujos Alternativos

### A1 – Sin productos disponibles
1. En el paso 2, no existen productos creados.  
2. El sistema muestra un mensaje: *“Aún no tienes productos creados.”*  
3. Se ofrece acceso directo a **“Crear Producto”**.

---

### A2 – Error cargando listado
1. En el paso 2, ocurre un error al recuperar los productos.  
2. El sistema muestra: *“Error al cargar los productos.”*  
3. Se brinda la opción de reintentar.

---

## 6. Excepciones del Sistema
- **E1 – Fallo al conectar con el repositorio de productos.**  
- **E2 – Permisos insuficientes para gestionar productos.**  
- **E3 – Error interno en filtros o paginación.**

---

## 7. Postcondiciones
- El usuario ha gestionado productos existentes o creado nuevos.  
- Pueden haber cambiado los estados de publicación o el contenido de productos.  
- Las listas y vistas quedan actualizadas según las operaciones realizadas.

---

## 8. Puntos de Inclusión
- **CU2.1 – Listar/Buscar Productos**  
- **CU2.2 – Crear Producto**  
- **CU2.3 – Editar Producto**  
- **CU2.4 – Eliminar Producto**  
- **CU-T1 – Exportar Datos**

---

## 9. Puntos de Extensión
- **CU-R10 – Ver Publicación** (desde CU2.1 y CU2.3)  
- **CU-R9 – Crear Producto desde Diseño** (incluido dentro de CU2.2)

---

## 10. Requisitos Relacionados
- **RF07 – Crear productos**  
- **RF08 – Generar vista previa de producto**  
- **RF09 – Publicar / despublicar producto**  
- **RF10 – Gestionar productos (listar, editar, eliminar)**  
- **RF14 – Exportar datos**
