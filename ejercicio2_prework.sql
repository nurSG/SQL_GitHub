--EJERCICIO 2

--1. Crea una base de datos llamada "MiBaseDeDatos".
/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y
"edad" (entero).*/
CREATE TABLE IF NOT EXISTS usuarios(
       id INT PRIMARY KEY,
	   nombre VARCHAR(255),
	   edad INT
);

--3. Inserta dos registros en la tabla "Usuarios".

INSERT INTO public.usuarios(id,nombre,edad)
VALUES (1,'Ken', 21),(2,'Barbie',19);

--4. Actualiza la edad de un usuario en la tabla "Usuarios".
UPDATE public.usuarios
SET edad = 34
WHERE id=1;

--5. Elimina un usuario de la tabla "Usuarios".
DELETE FROM public.usuarios
WHERE id=2;

---Nivel de dificultad: Moderado

/*1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y 
"pais" (texto).*/
CREATE TABLE IF NOT EXISTS ciudades(
     id INT PRIMARY KEY,
	 nombre VARCHAR(255),
	 pais VARCHAR(255)
);


--2. Inserta al menos tres registros en la tabla "Ciudades".
INSERT INTO ciudades(id,nombre,pais)
VALUES (1,'Berlín','Alemania'),(2,'París','Francia'),(3,'Oslo','Suecia');

--3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".
ALTER TABLE usuarios
ADD COLUMN ciudades_id INT

ALTER TABLE usuarios
ADD CONSTRAINT FK_ciudades FOREIGN KEY (ciudades_id) REFERENCES ciudades(id)


/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país 
(utiliza un LEFT JOIN).*/

INSERT INTO usuarios (id,nombre,edad,ciudades_id)
VALUES (2,'Barbie',21,2),(3,'Stephen',28,3);

UPDATE usuarios
SET ciudades_id =1
WHERE id=1;

SELECT u.nombre AS Usuario,
       c.nombre AS Ciudad
FROM usuarios AS u
LEFT JOIN ciudades AS c
ON c.id = u.ciudades_id;

--5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).

SELECT u.nombre AS Usuario,
       c.nombre AS Ciudad
FROM usuarios AS u
INNER JOIN ciudades AS c
ON c.id = u.ciudades_id;
