# CU2.3 – Editar Producto
**Estado:** En desarrollo  
**Versión:** 1.0  

## 1. Descripción
Permite al Diseñador modificar un Producto existente. No se puede cambiar el Modelo.  
El sistema recalcula la vista previa, precio final y actualiza la Publicación si corresponde.

## 2. Actor Principal
Diseñador

## 3. Precondiciones
- El usuario debe ser Diseñador.
- Debe existir un Producto válido.
- Debe existir un Diseño asociado.
- Debe existir un Modelo asociado (no modificable).

## 4. Flujo Normal
1. El Diseñador selecciona “Editar Producto”.
2. El sistema muestra el formulario con datos actuales:
   - Información del diseño (solo lectura)
   - Modelo (solo lectura)
   - Descripción editable
   - Sección de comisión y precio
   - Estado publicado/no publicado
   - Vista previa actual
3. El Diseñador modifica la descripción.
4. El Diseñador ajusta la comisión.
5. El sistema **incluye CU-R8 – Calcular Precio/Comisión**.
6. El sistema **incluye CU-R5 – Generar Vista Previa**.
7. El Diseñador cambia estado Publicado/No Publicado.
8. El Diseñador presiona “Guardar Producto”.
9. El sistema valida datos obligatorios.
10. El sistema actualiza el Producto.
11. Si corresponde, actualiza la Publicación asociada.
12. El sistema confirma los cambios.
13. El sistema retorna a CU2.1 – Listar/Buscar Productos.

## 5. Flujos Alternativos
### A1 – Datos inválidos
- Se muestran errores y se retorna a edición.

### A2 – Error generando vista previa
- Se muestra placeholder y se registra incidente.

### A3 – Error al guardar
- El sistema informa el error y no guarda cambios.

## 6. Excepciones del Sistema
E1 – Permisos insuficientes  
E2 – Fallo al actualizar publicación  
E3 – Error en cálculo de precio  

## 7. Postcondiciones
- El Producto queda actualizado.
- La Publicación refleja la nueva información.

## 8. Puntos de Inclusión
- CU-R5 – Generar Vista Previa  
- CU-R8 – Calcular Precio/Comisión  

## 9. Puntos de Extensión
- CU-R10 – Ver Publicación  

## 10. Requisitos Relacionados
RF13 – Editar productos  
RF17 – Publicar/Despublicar