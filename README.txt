# Proyecto Base de Datos - WAM Publicidad

Este proyecto corresponde al desarrollo de una base de datos para la empresa **WAM Publicidad**, dedicada a la venta de productos y gestión de inventario. 
La base de datos fue diseñada utilizando PostgreSQL y gestionada a través de **pgAdmin 4**.

## 🏢 Descripción de la Empresa

**WAM Publicidad** es una empresa orientada a la venta de calcomanías, materiales y repuestos para herramientas como pulidoras y taladros. 
Su objetivo es ofrecer productos de alta calidad al público en general y mantener un control eficiente sobre sus ventas e inventario.

## 🗃️ Objetivo del Proyecto

Diseñar e implementar una base de datos relacional que permita registrar:

- Productos
- Categorías de productos
- Compras y detalles de compra
- Clientes y devoluciones
- Proveedores y productos suministrados
- Empleados, departamentos y gerentes
- Ciudades asociadas a clientes y proveedores

## 🧩 Modelo Lógico

El modelo lógico incluye las siguientes entidades principales:

- **PRODUCT**: Información del producto (nombre, tipo, valor).
- **PRODUCT_CATEGORY**: Clasificación de los productos.
- **PURCHASE** y **PURCHASE_DETAIL**: Registro de compras y detalles por producto.
- **CLIENT**: Datos de clientes.
- **DEVOLUTION**: Control de devoluciones.
- **SUPPLIER** y **PRODUCT_SUPPLIER**: Información de proveedores y relación con productos.
- **EMPLOYEE**  Datos del personal.
- **DEPARTMENT** y **CITY**: Organización interna y localización.

## 📂 Archivos Incluidos

- `backup_proyecto.sql`: Respaldo de la base de datos en formato SQL.
- Diagrama del modelo lógico: Imagen del esquema entidad-relación.
- Modelo Logico.
- Documentacion

## 💾 Restauración del Backup

1. Abre **pgAdmin 4**.
2. Selecciona el esquema donde deseas restaurar la base de datos.
3. Haz clic derecho y selecciona **Restore** (Restaurar).
4. Selecciona el archivo `backup_proyecto.sql`.
5. Ejecuta la restauración.

## ⚙️ Tecnologías Utilizadas

- PostgreSQL
- pgAdmin 4
- GitHub

## 📌 Autor

- **Angelo Acosta**
- Proyecto académico Base de Datos – 6to semestre
