# CU-R1 – Validar Imagen
**Estado:** En desarrollo  
**Versión:** 1.2

---

## 1. Descripción
Caso de uso reutilizable que valida que una imagen seleccionada por el usuario cumple con los requisitos mínimos para ser utilizada en el sistema (por ejemplo, para Diseños o Colecciones).

---

## 2. Actor Principal
- Sistema (invocado internamente por otros CU)

---

## 3. Precondiciones
- El usuario seleccionó un archivo de imagen desde el CU llamador.
- El archivo está accesible para el sistema.

---

## 4. Flujo Normal
1. El CU llamador envía al sistema la imagen seleccionada.
2. El sistema valida que el archivo sea una imagen en un formato permitido.
3. El sistema valida que el tamaño del archivo esté dentro del límite permitido.
4. El sistema valida que la resolución mínima requerida sea cumplida.
5. Si todas las validaciones son correctas, retorna “imagen válida”.
6. El CU llamador continúa con su flujo normal.

---

## 5. Flujos Alternativos

### A1 – Formato inválido
1. En el paso 2 se detecta un formato no permitido.
2. Se retorna “imagen inválida”.
3. El CU llamador informa al usuario.

### A2 – Tamaño excesivo
1. En el paso 3 el archivo supera el tamaño permitido.
2. Se retorna “imagen inválida”.
3. El CU llamador informa al usuario.

### A3 – Resolución insuficiente
1. En el paso 4 la imagen no cumple las dimensiones mínimas.
2. Se retorna “imagen inválida”.
3. El CU llamador informa al usuario.

---

## 6. Postcondiciones
- Se retorna al CU llamador el resultado de la validación (válido / inválido).

---

## 7. Puntos de Inclusión
Invocado por:
- **CU1.1 – Subir Diseño**  
- **CU1.2 – Editar Diseño**  
- **CU3.1 / CU3.2 – Crear/Editar Colección** (si llevan imagen de portada)  
*(NO se mencionan modelos/productos porque no existen CU formales que lo usen.)*

---

## 8. Puntos de Extensión
- Ninguno.

---

## 9. Requisitos Relacionados
- **RF04 – Validar imágenes cargadas**
