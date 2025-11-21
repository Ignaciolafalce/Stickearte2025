# CU-R5 – Generar Vista Previa
**Estado:** En desarrollo  
**Versión:** 1.4  

---

## 1. Descripción
Caso de uso reutilizable encargado de **generar la imagen de Vista Previa** de un Producto, superponiendo:

- La imagen del Diseño  
- Sobre la imagen mockup del Modelo seleccionado

La vista previa se utiliza para mostrar al Diseñador cómo quedará el Producto final antes de guardarlo.  
Este CU se invoca desde **CU-R9 – Crear Producto desde Diseño** y desde cualquier flujo futuro que requiera previsualización dinámica.

---

## 2. Actor Principal
- **Diseñador**

*(El actor no interactúa directamente con este CU; lo invoca el CU llamador.)*

---

## 3. Precondiciones
- El CU llamador debe haber proporcionado:
  - `DiseñoId` válido
  - `ModeloId` válido
- El Diseño debe tener imagen principal disponible.
- El Modelo debe contar con mockup base para superponer.
- El sistema debe tener disponible el servicio generador de vistas previas.

---

## 4. Flujo Normal

1. El CU llamador solicita generar vista previa enviando:  
   - `DiseñoId`  
   - `ModeloId`
2. El sistema obtiene:  
   - Imagen del Diseño  
   - Mockup base del Modelo  
   - Información de posición/escala si el Modelo define coordenadas de superposición
3. El sistema valida ambas imágenes:
   - Que existan  
   - Que no estén dañadas  
   - Que sean formatos soportados
4. El sistema combina la imagen del Diseño sobre el mockup base aplicando:
   - Escalado  
   - Posicionamiento  
   - Transparencia (si aplica)
5. El sistema genera un **archivo temporal** de la vista previa (PNG o WebP).
6. El sistema devuelve al CU llamador:  
   - `VistaPreviaImageId` / `blob` / `dataURL` (según implementación)  
   - Dimensiones resultantes  
   - Estado de éxito
7. El CU llamador muestra la Vista Previa al usuario.

---

## 5. Flujos Alternativos

### A1 – Imagen del diseño no disponible
1. En el paso 2, el sistema no puede obtener la imagen.  
2. Muestra error al CU llamador: *“No se pudo cargar la imagen del diseño.”*  
3. Se envía estado de error y no se genera vista previa.  
4. Retorna al CU llamador.

---

### A2 – Mockup del modelo no disponible
1. En el paso 2, el mockup base no existe o está dañado.  
2. Muestra error al CU llamador: *“No se pudo cargar la imagen del modelo.”*  
3. Retorna al CU llamador.

---

### A3 – Error al procesar la superposición
1. En el paso 4, ocurre un fallo en la librería gráfica.  
2. El sistema registra el error.  
3. Devuelve mensaje: *“Ocurrió un error al generar la vista previa.”*  
4. No se genera preview.

---

## 6. Excepciones del Sistema
- **E1 – Timeout del servicio de imágenes**  
- **E2 – Error de memoria durante el procesamiento**  
- **E3 – Archivos corruptos / formato no soportado**  

---

## 7. Postcondiciones
- Se genera una vista previa temporal válida (si no hubo errores).  
- El CU llamador obtiene la imagen para mostrarla en pantalla.  
- No se guardan cambios definitivos en el Producto.

---

## 8. Puntos de Inclusión
- Incluido en:
  - **CU-R9 – Crear Producto desde Diseño**  
  - Futuro: edición visual de productos si se habilita

---

## 9. Puntos de Extensión
- Ninguno

---

## 10. Requisitos Relacionados
- **RF08 – Generar vista previa del producto**  
- **RF05 – Usar imagen del diseño y mockup del modelo**  
