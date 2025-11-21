# CU1 – Gestionar Diseños
**Código:** CU1  
**Estado:** En desarrollo (Iteración 1 – ICONIX)  
**Actor principal:** Diseñador  

---

## 1. Descripción General
Este caso de uso agrupa todas las funcionalidades relacionadas con la gestión de diseños realizadas por el Diseñador dentro del sistema.  
Incluye las capacidades de crear, visualizar, editar y eliminar diseños, así como funcionalidades transversales como validación de imágenes, generación de miniaturas y exportación de datos.

Este caso de uso funciona como **caso de uso padre** dentro del modelo ICONIX y no representa una interacción única con el sistema.

---

## 2. Objetivo
Permitir que el diseñador gestione su catálogo de diseños, manteniendo organizado el material visual necesario para la creación de productos.

---

## 3. Casos de Uso Incluidos
- **CU1.1 – Subir Diseño**
- **CU1.4 – Listar/Buscar Diseños**

### Casos de Uso Reutilizables incluidos
- **CU-R1 – Validar Imagen**
- **CU-R2 – Generar Thumbnail**

---

## 4. Casos de Uso Extendidos
- **CU1.2 – Editar Diseño**
- **CU1.3 – Eliminar Diseño**
- **CU-T1 – Exportar Datos**
- **CU-R9 – Crear Producto desde Diseño**

---

## 5. Requisitos Funcionales Relacionados
- **RF03 – Crear diseños**
- **RF04 – Validar imágenes cargadas**
- **RF05 – Generar miniaturas automáticamente**
- **RF06 – Gestionar diseños (listar, editar, eliminar)**
- **RF14 – Exportar información**

---

## 6. Observaciones
- Este caso de uso funciona como **agrupador** y **no posee flujo normal ni alternativo**.
- Cada subcaso de uso será especificado individualmente con su plantilla completa.
- Los casos de uso reutilizables se incluyen en los flujos detallados de los subcasos.
