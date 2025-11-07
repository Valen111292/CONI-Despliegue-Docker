--
-- Estructura de tabla para la tabla actas

CREATE TABLE actas (
id_acta SERIAL PRIMARY KEY,
nombre_completo VARCHAR(100) NOT NULL,
cedula VARCHAR(20) NOT NULL,
n_inventario VARCHAR(255) NOT NULL,
fecha DATE NOT NULL DEFAULT CURRENT_DATE,
ruta_pdf VARCHAR(255) NOT NULL
);

--
-- Estructura de tabla para la tabla empleados

CREATE TABLE empleados (
id_empleado SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
cedula VARCHAR(20) NOT NULL,
cargo VARCHAR(50) NOT NULL,
departamento VARCHAR(50) NOT NULL,
correo VARCHAR(100) NOT NULL,
telefono VARCHAR(20) NOT NULL,
fecha_ingreso DATE NOT NULL
);

--
-- Estructura de tabla para la tabla equipos

CREATE TABLE equipos (
n_inventario VARCHAR(255) PRIMARY KEY,
tipo VARCHAR(50) NOT NULL,
serial_base VARCHAR(100) NOT NULL,
marca VARCHAR(50) NOT NULL,
ram VARCHAR(20),
disco VARCHAR(50),
procesador VARCHAR(50),
estado VARCHAR(20) NOT NULL
);

--
-- Estructura de tabla para la tabla informes_generados

CREATE TABLE informes_generados (
id SERIAL PRIMARY KEY,
nombre_informe VARCHAR(255) NOT NULL,
fecha_generacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
id_usuario_generador INTEGER,
ruta_archivo VARCHAR(255) NOT NULL
);

--
-- Estructura de tabla para la tabla solicitudes_compra

CREATE TABLE solicitudes_compra (
id SERIAL PRIMARY KEY,
item_solicitado VARCHAR(255) NOT NULL,
cantidad INTEGER NOT NULL,
justificacion TEXT NOT NULL,
estado VARCHAR(50) NOT NULL,
fecha_solicitud DATE NOT NULL DEFAULT CURRENT_DATE
);

--
-- Estructura de tabla para la tabla usuarios

CREATE TABLE usuarios (
id SERIAL PRIMARY KEY,
username VARCHAR(50) NOT NULL,
password VARCHAR(255) NOT NULL,
rol VARCHAR(50) NOT NULL,
fecha_creacion DATE NOT NULL DEFAULT CURRENT_DATE
);

--
-- Restricciones de Clave Foránea (Foreign Keys)

ALTER TABLE informes_generados
ADD CONSTRAINT fk_usuario_generador
FOREIGN KEY (id_usuario_generador)
REFERENCES usuarios (id) ON DELETE SET NULL;