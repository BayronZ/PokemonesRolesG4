\c mrcoco
DROP DATABASE pokerols;
CREATE DATABASE pokerols;
\c pokerols

CREATE TABLE rol(
    id SERIAL,
    nombre VARCHAR(50),
    descripcion VARCHAR,
    PRIMARY KEY (id)
);

SELECT * FROM rol;

CREATE TABLE usuario(
    rut VARCHAR(20),
    nombre VARCHAR(50),
    telefono INT,
    mail VARCHAR(30),
    genero VARCHAR(30),
    fecha_nacimiento DATE,
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES rol(id)
);

SELECT * FROM usuario;

INSERT INTO rol (nombre, descripcion)
VALUES ('administrador', 'control total');
INSERT INTO rol ( nombre, descripcion)
VALUES ('marketing','editar y crear anuncios');
INSERT INTO rol (nombre, descripcion)
VALUES ('editor','editar articulos');
INSERT INTO rol (nombre, descripcion)
VALUES ('subscriptor', 'leer articulos');

SELECT * FROM rol;

INSERT INTO usuario(rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES ('1-9','Juan Soto', 9999999, 'juan.soto@gmial.com', 'M', '2000-06-24',1);
INSERT INTO usuario(rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES ('2-7', 'Jorge perez', 8888888, 'jorge.perez@hotmail.com', 'M', '1998-03-12', 4);
INSERT INTO usuario(rut, nombre, telefono, mail, genero, fecha_nacimiento)
VALUES ('3-5', 'Sara Morales', 7777777, 'sara.morales@gmail.com', 'F', '1990-02-11');
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES ('4-6','Sarita Morales', 4444444, 'sarita.morales@gmail.com', 'F', '1990-02-11', 2);
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento)
VALUES ('1-8','Maria del Barrio', 5555555, 'lamaria@gmail.com', 'F', '1990-02-11');



-- SELECT * FROM usuario;

-- SELECT * FROM rol INNER JOIN usuario ON rol.id = usuario.rol_id;

SELECT rol.nombre 
FROM rol JOIN usuario 
ON rol.id = usuario.rol_id 
WHERE usuario.genero = 'M';

SELECT A.nombre
FROM rol AS A
JOIN usuario AS B
ON A.id = B.rol_id
WHERE B.genero = 'M';

--left join

SELECT * FROM usuario
JOIN rol
ON usuario.rol_id = rol.id;


SELECT * FROM usuario
LEFT JOIN rol
ON usuario.rol_id = rol.id;


----------------------------------
--vamos a traer los roles que no tengan usuario
--NULL es la ausencia de valor
-- blank es que esta en blanco, por ejemplo al borrar un dato de una tabla

SELECT rol.* --se selecciona todo de la tabla rol
FROM rol -- desde rol
LEFT JOIN usuario --unir con la tabla usuario
ON rol.id = usuario.rol_id -- donde el id sea igual
WHERE usuario.rol_id IS NULL; -- donde no haya id

--Ejemplo defull outer join
SELECT *
FROM rol
FULL OUTER JOIN usuario
ON rol.id = usuario.rol_id;

--full outer join con datos vacios

SELECT *
FROM usuario
FULL OUTER JOIN rol
ON usuario.rol_id = rol.id
WHERE usuario.rol_id IS NULL
OR rol.id IS NULL;