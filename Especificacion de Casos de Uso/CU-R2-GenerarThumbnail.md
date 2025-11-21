# CU-R2 – Generar Thumbnail
**Estado:** En desarrollo  
**Versión:** 1.2

---

## 1. Descripción
Genera automáticamente una miniatura a partir de una imagen válida para ser utilizada en listados, catálogos o vistas previas del sistema.

---

## 2. Actor Principal
- Sistema

---

## 3. Precondiciones
- La imagen original pasó la validación (CU-R1).
- El CU llamador requiere una miniatura.

---

## 4. Flujo Normal
1. El CU llamador solicita la generación de una miniatura.
2. El sistema procesa la imagen original.
3. El sistema genera una miniatura con las dimensiones predefinidas.
4. El sistema almacena la miniatura.
5. El sistema devuelve la referencia/identificador de la miniatura al CU llamador.

---

## 5. Flujos Alternativos

### A1 – Error en el procesamiento
1. Ocurre un error al generar la miniatura.
2. El sistema informa al CU llamador.
3. El CU llamador decide si permite reintentar o abortar.

### A2 – Error en el almacenamiento
1. Hay un problema al guardar la miniatura.
2. El sistema informa del fallo.
3. Finaliza el caso sin generar miniatura.

---

## 6. Postcondiciones
- El sistema genera y registra la miniatura correspondiente.

---

## 7. Puntos de Inclusión
Invocado por:
- **CU1.1 – Subir Diseño**  
- **CU1.2 – Editar Diseño**  
- **CU3.1 – Crear Colección** (si tiene imagen)  
- **CU3.2 – Editar Colección**  
- **CU-R9 – Crear Producto desde Diseño**  
*(Porque Producto tiene miniatura generada y existe un CU formal que lo usa.)*

---

## 8. Puntos de Extensión
- Ninguno.

---

## 9. Requisitos Relacionados
- **RF05 – Generar miniaturas automáticamente**
