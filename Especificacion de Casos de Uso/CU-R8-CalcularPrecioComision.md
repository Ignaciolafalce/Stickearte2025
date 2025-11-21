# CU-R8 – Calcular Precio / Comisión
**Estado:** En desarrollo  
**Versión:** 1.3  

---

## 1. Descripción
Caso de uso reutilizable encargado de **calcular dinámicamente**:

- Comisión en pesos  
- Precio final del Producto  

A partir de:

- Costo base del Modelo  
- Porcentaje de comisión elegido por el Diseñador  

Este CU se utiliza tanto en **CU-R9 – Crear Producto desde Diseño** como en **CU2.3 – Editar Producto**, y en cualquier proceso donde el diseñador modifique la comisión.

---

## 2. Actor Principal
- **Diseñador**

*(No interactúa directamente con este CU; lo invoca el CU llamador.)*

---

## 3. Precondiciones
- El CU llamador debe proveer:
  - `ModeloId` (para obtener costo base)  
  - `ComisionPorcentaje` (valor numérico)  
- Debe existir un costo base registrado para el modelo.  
- El porcentaje de comisión debe ser un valor permitido por las reglas del sistema.

---

## 4. Flujo Normal

1. El CU llamador envía al sistema:
   - `CostoBase`  
   - `ComisionPorcentaje`  
2. El sistema valida el porcentaje de comisión:
   - Que sea un número  
   - Que esté dentro de los rangos permitidos (regla de negocio RN-CP1)  
3. El sistema calcula la **Comisión en pesos**:  
   \[
   ComisionPesos = CostoBase \times (ComisionPorcentaje / 100)
   \]
4. El sistema calcula el **Precio Final**:  
   \[
   PrecioFinal = CostoBase + ComisionPesos
   \]
5. El sistema devuelve al CU llamador:
   - `ComisionPesos`  
   - `PrecioFinal`  
   - Estado de éxito  
6. El CU llamador actualiza la interfaz y muestra los valores al Diseñador.

---

## 5. Flujos Alternativos

### A1 – Porcentaje fuera del rango permitido
1. En el paso 2, se detecta que `ComisionPorcentaje` está fuera de rango.  
2. El CU devuelve error: *“El porcentaje de comisión no es válido.”*  
3. El CU llamador muestra el mensaje y solicita corregir el valor.  
4. Retorna al paso donde el usuario ingresa la comisión.

---

### A2 – Costo base inválido
1. En el paso 1, el sistema detecta que el costo base es:
   - Negativo  
   - Cero  
   - No numérico  
2. Devuelve error: *“Costo base inválido.”*  
3. No se calcula ningún valor.  
4. Retorna al CU llamador.

---

## 6. Excepciones del Sistema
- **E1 – Error aritmético inesperado**  
- **E2 – Falla al obtener el costo base del modelo** (si el CU llamador solo pasa el ModeloId)  
- **E3 – Error de formato numérico**  

---

## 7. Postcondiciones
- El sistema devuelve valores válidos de comisión y precio final (si no hubo errores).  
- No se almacena ningún dato.  
- No se modifica el Producto; solo es cálculo temporal.

---

## 8. Puntos de Inclusión
- Incluido en:
  - **CU-R9 – Crear Producto desde Diseño**  
  - **CU2.3 – Editar Producto**

---

## 9. Puntos de Extensión
- Ninguno

---

## 10. Reglas de Negocio Asociadas

### **RN-CP1 – Rango de Comisión Permitido**
- El porcentaje de comisión debe estar entre **0% y 50%** *(valor ajustable por el sistema)*.  
- Si el porcentaje está fuera del rango, el cálculo queda invalidado.

### **RN-CP2 – Redondeo**
- Los valores monetarios se redondean a **2 decimales**.

### **RN-CP3 – Precio Final Mínimo**
- El precio final nunca puede ser menor que el costo base (implícito por definición).

---

## 11. Requisitos Relacionados
- **RF09 – Calcular precio final del producto**  
- **RF10 – Configurar porcentaje de comisión**  
- **RF11 – Validaciones comerciales de precios**  
