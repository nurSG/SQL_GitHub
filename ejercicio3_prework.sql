--EJERCICIO 3

/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y 
"precio" (numérico).*/
CREATE TABLE IF NOT EXISTS productos(
      id INT PRIMARY KEY,
	  nombre VARCHAR(255),
	  precio DECIMAL
)

--2. Inserta al menos cinco registros en la tabla "Productos".
INSERT INTO productos(id,nombre,precio)
VALUES (1,'Camiseta',3.55),(2,'Pantalón',20),(3,'Gafas',10.05),(4,'Sudadera',30),(5,'Abrigo',110);


--3. Actualiza el precio de un producto en la tabla "Productos".
UPDATE productos
SET precio = 10.99
WHERE id=3;

--4. Elimina un producto de la tabla "Productos".
DELETE FROM productos
WHERE id=4;


/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han 
comprado (utiliza un INNER JOIN con la tabla "Productos").*/

DELETE FROM productos
WHERE id=5;
ALTER TABLE productos
ADD CONSTRAINT FK_usuarios FOREIGN KEY (id) REFERENCES usuarios(id);

SELECT u.nombre AS Usuario,
       p.nombre AS Prodcuto
FROM usuarios AS u
INNER JOIN productos AS p
ON p.id = u.id;





