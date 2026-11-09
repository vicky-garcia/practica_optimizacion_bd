CREATE DATABASE IF NOT EXISTS practica_indices;
USE practica_indices;

CREATE TABLE cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    correo VARCHAR(120) NOT NULL,
    ciudad VARCHAR(60) NOT NULL,
    fecha_registro DATE NOT NULL,
    activo TINYINT NOT NULL DEFAULT 1
);

INSERT INTO cliente
(nombre, apellido, correo, ciudad, fecha_registro, activo)
VALUES
('Ana', 'Gómez', 'ana.gomez@ejemplo.com', 'Manizales', '2025-01-10', 1),
('Luis', 'Pérez', 'luis.perez@ejemplo.com', 'Pereira', '2025-02-15', 1),
('Sara', 'López', 'sara.lopez@ejemplo.com', 'Manizales', '2025-03-20', 1),
('Juan', 'Rojas', 'juan.rojas@ejemplo.com', 'Armenia', '2025-04-05', 0),
('Marta', 'Díaz', 'marta.diaz@ejemplo.com', 'Pereira', '2025-05-12', 1),
('Diego', 'Vargas', 'diego.vargas@ejemplo.com', 'Manizales', '2025-06-18', 1),
('Paula', 'Ruiz', 'paula.ruiz@ejemplo.com', 'Armenia', '2025-07-02', 0),
('Carlos', 'Mora', 'carlos.mora@ejemplo.com', 'Pereira', '2025-08-23', 1);


CREATE INDEX idx_cliente_fecha ON cliente (fecha_registro);

SELECT cliente_id, nombre, fecha_registro
FROM cliente WHERE fecha_registro >= '2025-05-01';

explain SELECT cliente_id, nombre, fecha_registro
FROM cliente WHERE fecha_registro >= '2025-05-01';


CREATE INDEX idx_cliente_ciudad_activo
ON cliente (ciudad, activo);

SELECT cliente_id, nombre, apellido
FROM cliente WHERE ciudad = 'Pereira' AND activo = 1;

explain SELECT cliente_id, nombre, apellido
FROM cliente WHERE ciudad = 'Pereira' AND activo = 1;

SELECT correo, COUNT(*) AS cantidad
FROM cliente GROUP BY correo HAVING COUNT(*) > 1;

CREATE UNIQUE INDEX uq_cliente_correo ON cliente (correo);

SHOW INDEX FROM cliente;

