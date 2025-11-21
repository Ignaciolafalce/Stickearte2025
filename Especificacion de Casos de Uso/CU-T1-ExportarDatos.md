# CU-T1 – Exportar Datos
**Estado:** En desarrollo  
**Versión:** 1.1  

---

## 1. Descripción
Caso de uso transversal que permite exportar los datos mostrados en distintos listados 
(Diseños, Productos, Colecciones, Historial de Compras, etc.) en uno de los formatos disponibles 
(CSV, PDF u otros definidos por el sistema).

Se invoca como **include** desde los casos de uso que presentan listados exportables.

---

## 2. Actor Principal
- Diseñador / Administrador / Usuario Comprador (según el módulo)

---

## 3. Precondiciones
- El usuario debe estar autenticado.
- El listado desde el cual se lo invoca contiene datos visibles.
- El usuario tiene permisos para acceder a dicho listado.

---

## 4. Flujo Normal
1. El usuario selecciona la opción **“Exportar”** en un listado.
2. El sistema muestra las opciones de exportación:
   - Formato disponible (CSV, PDF).
   - Alcance: todos los registros o solo los filtrados.
3. El usuario confirma la operación.
4. El sistema valida que existan registros para exportar.
   - Si no existen, se aplica A2.
5. El sistema obtiene los datos según el alcance seleccionado.
6. El sistema genera el archivo en el formato solicitado.
7. El sistema pone el archivo a disposición del usuario para su descarga.
8. Finaliza el caso de uso.

---

## 5. Flujos Alternativos

### A1 – Formato no soportado
1. En el paso 3 el sistema detecta que el formato solicitado no está habilitado.
2. Muestra un mensaje de error.
3. El usuario debe seleccionar otro formato.
4. Retorna al paso 2.

### A2 – No hay datos para exportar
1. En el paso 4, el sistema determina que no hay registros.
2. Muestra un mensaje: “No hay datos disponibles para exportar.”
3. Finaliza el CU.

### A3 – Error en la generación del archivo
1. En el paso 6 ocurre un fallo interno.
2. El sistema informa el error.
3. Finaliza el CU sin generar archivo.

### A4 – Error en la descarga
1. En el paso 7 no se puede iniciar la descarga.
2. Muestra un mensaje indicando el fallo.
3. El usuario puede reintentar la operación.

---

## 6. Excepciones del Sistema
- E1 – Problemas de permisos.  
- E2 – Error del servicio de generación.  
- E3 – Interrupciones de conectividad.

---

## 7. Postcondiciones
- Se genera un archivo exportable.
- El usuario obtiene o intenta descargar dicho archivo.

---

## 8. Puntos de Inclusión
- Invocado desde:
  - **CU1.4 – Listar/Buscar Diseños**
  - **CU2.1 – Listar/Buscar Productos**
  - **CU3.4 – Listar Colecciones**
  - **CU4.11 – Ver Historial de Compras**
  - Otros casos de uso que presenten listados exportables

---

## 9. Puntos de Extensión
- Ninguno.

---

## 10. Requisitos Relacionados
- **RF14 – Exportar datos en múltiples formatos**
