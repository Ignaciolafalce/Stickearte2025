# CU1.1 – Subir Diseño
**Estado:** En desarrollo  
**Versión:** 1.3  

---

## 1. Descripción
Permite al Diseñador crear un nuevo diseño subiendo una imagen, completando datos básicos (título, descripción, categoría, visibilidad, tags) y registrándolo en el sistema.  
El sistema valida la imagen, genera una miniatura y almacena la información.

---

## 2. Actor Principal
- Diseñador

---

## 3. Precondiciones
- El usuario debe estar autenticado con rol Diseñador.
- Debe existir al menos una categoría disponible.
- El usuario debe tener acceso al archivo de imagen a cargar.

---

## 4. Flujo Normal

1. El Diseñador selecciona la opción **"Subir Diseño"**.

2. El sistema muestra un formulario con:  
   - Título  
   - Descripción  
   - Categoría  
   - Visibilidad (Público / Privado / Unlisted)  
   - Imagen  
   - Tags (campo con autocompletado y botón “Agregar”)  
   - Botones: **Guardar**, **Limpiar**

3. El Diseñador completa el título, descripción opcional, categoría y visibilidad.

4. El Diseñador selecciona una imagen desde su dispositivo.

5. El sistema **incluye CU-R1 – Validar Imagen**.

6. El Diseñador agrega tags:  
   6.1. Escribe un tag en el campo.  
   6.2. El sistema sugiere tags existentes.  
   6.3. Si el tag no existe, el diseñador puede crearlo.  
   6.4. El tag se agrega a la lista del diseño.

7. El sistema verifica que el diseño tenga **al menos 3 tags**.  
   7.1. Si cumple, continúa.  
   7.2. Si no cumple, se aplica flujo alternativo A5.

8. El Diseñador pulsa el botón **“Guardar”**.

9. **El sistema valida los datos obligatorios**:  
   - Título no vacío  
   - Categoría seleccionada  
   - Visibilidad válida  
   - Al menos 3 tags  
   - Imagen previamente validada por CU-R1  
   - Descripción opcional  

   Si alguna validación falla → *A3 – Faltan datos obligatorios*.

10. El sistema guarda temporalmente la imagen cargada.

11. El sistema **incluye CU-R2 – Generar Thumbnail**.

12. El sistema crea el registro de **Diseño** con imagen principal y miniatura.

13. El sistema asocia los tags al diseño.

14. El sistema confirma la creación del diseño.

15. El Diseñador vuelve a la lista de diseños (**CU1.4 – Listar/Buscar Diseños**).

---

## 5. Flujos Alternativos

### A1 – Imagen inválida
1. En el paso 5, CU-R1 determina que el archivo es inválido.  
2. El sistema muestra el error y descarta el archivo.  
3. El Diseñador selecciona otra imagen.  
4. Retorna al paso 4 del flujo normal.

---

### A2 – Tag duplicado
1. En el paso 6.4, el sistema detecta que el tag ya está en la lista.  
2. El sistema muestra un aviso no intrusivo.  
3. Retorna al paso 6.

---

### A3 – Faltan datos obligatorios
1. En el paso 9, el sistema detecta campos incompletos o inválidos.  
2. Se muestran mensajes indicando los errores (título vacío, categoría no seleccionada, menos de 3 tags, visibilidad inválida, etc.).  
3. El Diseñador corrige los datos.  
4. Retorna al paso 3, 6 o 7 según corresponda.

---

### A4 – Botón “Limpiar”
1. En el paso 2, el Diseñador presiona el botón **“Limpiar”**.  
2. El sistema restablece todos los campos del formulario.  
3. Retorna al paso 2.

---

### A5 – Menos de 3 tags
1. En el paso 7.2, el sistema detecta que el diseño tiene menos de 3 tags.  
2. El sistema muestra un mensaje indicando que se requieren **al menos 3 tags**.  
3. El Diseñador agrega más tags.  
4. Retorna al paso 6 del flujo normal.

---

## 6. Excepciones del Sistema
- **E1 – Error al generar miniatura:** Se cancela el proceso y se comunica el error.  
- **E2 – Error de almacenamiento:** El sistema no puede guardar el diseño.  
- **E3 – Error en creación de tags nuevos:** El sistema guarda el diseño sin los tags nuevos y registra el incidente.

---

## 7. Postcondiciones
- Se registra un nuevo diseño en la base de datos.  
- Se almacena la imagen principal.  
- Se genera y guarda la miniatura.  
- Se crean tags nuevos si corresponde y se asocian al diseño.  
- El diseño aparece en la lista del usuario.

---

## 8. Puntos de Inclusión (include)
- **CU-R1 – Validar Imagen**  
- **CU-R2 – Generar Thumbnail**

---

## 9. Puntos de Extensión (extend)
- **CU-R9 – Crear Producto desde Diseño** (opcional, luego de crear el diseño)

---

## 10. Requisitos Relacionados
- **RF03 – Crear diseños**  
- **RF04 – Validar imágenes cargadas**  
- **RF05 – Generar miniaturas automáticamente**  
- **RF06 – Gestionar diseños (listar, editar, eliminar)**  
