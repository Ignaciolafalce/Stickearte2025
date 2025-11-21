# CU-R10 – Ver Publicación
**Estado:** En desarrollo  
**Versión:** 1.0  

## 1. Descripción
Caso de uso reutilizable que permite visualizar la Publicación asociada a un Producto. Es invocado desde:
- CU-R9 – Crear Producto desde Diseño
- CU2.1 – Listar/Buscar Productos
- CU2.3 – Editar Producto

## 2. Actor Principal
Usuario del sistema (Diseñador, Administrador, Comprador)

## 3. Precondiciones
- Debe existir un Producto válido.
- Debe existir una Publicación asociada.
- El usuario debe tener permiso para visualizarla.

## 4. Flujo Normal
1. El caso invocador solicita “Ver Publicación” con ProductId.
2. El sistema obtiene el Producto y la Publicación.
3. El sistema carga título, descripción, imágenes, modelo, diseño, precio y estado.
4. El sistema arma la vista.
5. El sistema muestra imagen final, título, modelo, tags, precio y acciones según rol.
6. El usuario navega la vista.
7. Finaliza.

## 5. Flujos Alternativos
### A1 – Publicación inexistente
- Se informa que no existe publicación y se ofrece generarla si el rol lo permite.

### A2 – Publicación restringida
- Se informa falta de permisos.

### A3 – Error al cargar imagen
- Se muestra placeholder y se registra incidente.

## 6. Excepciones del Sistema
E1 – Error al consultar  
E2 – Permisos insuficientes  
E3 – Error imagen  

## 7. Postcondiciones
- La publicación queda visualizada.

## 8. Puntos de Inclusión
Ninguno

## 9. Puntos de Extensión
- CU-R9 – Crear Producto desde Diseño
- CU2.1 – Listar/Buscar Productos
- CU2.3 – Editar Producto

## 10. Requisitos Relacionados
RF20, RF09, RF13, RF17
