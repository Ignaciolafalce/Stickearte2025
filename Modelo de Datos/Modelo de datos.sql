CREATE TABLE "Usuario" (
  "Id" uuid PRIMARY KEY,
  "Nombre" varchar(100),
  "Email" varchar(150) UNIQUE,
  "Rol" varchar(30),
  "FechaRegistro" datetime,
  "Activo" bool
);

CREATE TABLE "Imagen" (
  "Id" uuid PRIMARY KEY,
  "NombreArchivo" varchar(300),
  "Ruta" varchar(500),
  "MimeType" varchar(100),
  "Ancho" int,
  "Alto" int,
  "TamañoBytes" bigint,
  "FechaCreacion" datetime
);

CREATE TABLE "Categoria" (
  "Id" uuid PRIMARY KEY,
  "Titulo" varchar(200),
  "Visibilidad" varchar(20),
  "FechaCreacion" datetime
);

CREATE TABLE "Tag" (
  "Id" uuid PRIMARY KEY,
  "Nombre" varchar(50) UNIQUE
);

CREATE TABLE "Diseno" (
  "Id" uuid PRIMARY KEY,
  "Titulo" varchar(200),
  "Descripcion" text,
  "CategoriaId" uuid,
  "Visibilidad" varchar(20),
  "ImagenId" uuid,
  "MiniaturaId" uuid,
  "CreadoPorId" uuid,
  "FechaCreacion" datetime,
  "FechaActualizacion" datetime,
  "BajaLogica" bool
);

CREATE TABLE "DisenoTag" (
  "DisenoId" uuid,
  "TagId" uuid,
  PRIMARY KEY ("DisenoId", "TagId")
);

CREATE TABLE "Modelo" (
  "Id" uuid PRIMARY KEY,
  "Nombre" varchar(100),
  "TipoModelo" varchar(50),
  "Descripcion" text,
  "MockupImageId" uuid,
  "MiniaturaId" uuid,
  "Costo" decimal(10,2),
  "FechaCreacion" datetime,
  "BajaLogica" bool
);

CREATE TABLE "Producto" (
  "Id" uuid PRIMARY KEY,
  "DisenoId" uuid,
  "ModeloId" uuid,
  "Titulo" varchar(200),
  "Descripcion" text,
  "ImagenGeneradaId" uuid,
  "ImagenGeneradaMiniaturaId" uuid,
  "EsPublico" bool,
  "PrecioFinal" decimal(10,2),
  "Comision" decimal(10,2),
  "CreadoPorId" uuid,
  "FechaCreacion" datetime,
  "FechaPublicacion" datetime,
  "PublicadoPorId" uuid,
  "BajaLogica" bool
);

COMMENT ON TABLE "DisenoTag" IS 'PK compuesta';

ALTER TABLE "Diseno" ADD FOREIGN KEY ("CategoriaId") REFERENCES "Categoria" ("Id");

ALTER TABLE "Diseno" ADD FOREIGN KEY ("ImagenId") REFERENCES "Imagen" ("Id");

ALTER TABLE "Diseno" ADD FOREIGN KEY ("MiniaturaId") REFERENCES "Imagen" ("Id");

ALTER TABLE "Diseno" ADD FOREIGN KEY ("CreadoPorId") REFERENCES "Usuario" ("Id");

ALTER TABLE "DisenoTag" ADD FOREIGN KEY ("DisenoId") REFERENCES "Diseno" ("Id");

ALTER TABLE "DisenoTag" ADD FOREIGN KEY ("TagId") REFERENCES "Tag" ("Id");

ALTER TABLE "Modelo" ADD FOREIGN KEY ("MockupImageId") REFERENCES "Imagen" ("Id");

ALTER TABLE "Modelo" ADD FOREIGN KEY ("MiniaturaId") REFERENCES "Imagen" ("Id");

ALTER TABLE "Producto" ADD FOREIGN KEY ("DisenoId") REFERENCES "Diseno" ("Id");

ALTER TABLE "Producto" ADD FOREIGN KEY ("ModeloId") REFERENCES "Modelo" ("Id");

ALTER TABLE "Producto" ADD FOREIGN KEY ("ImagenGeneradaId") REFERENCES "Imagen" ("Id");

ALTER TABLE "Producto" ADD FOREIGN KEY ("ImagenGeneradaMiniaturaId") REFERENCES "Imagen" ("Id");

ALTER TABLE "Producto" ADD FOREIGN KEY ("CreadoPorId") REFERENCES "Usuario" ("Id");

ALTER TABLE "Producto" ADD FOREIGN KEY ("PublicadoPorId") REFERENCES "Usuario" ("Id");
