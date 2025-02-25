--EJERCICIO 4
/*1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave 
foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE IF NOT EXISTS pedidos (
       id INT PRIMARY KEY,
	   id_usuario INT,
	   CONSTRAINT FK_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
	   id_producto INT,
	   CONSTRAINT FK_producto FOREIGN KEY (id_producto) REFERENCES productos(id)
);



--2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.
INSERT INTO pedidos(id,id_usuario,id_producto)
VALUES (1,1,1),(2,2,2),(3,3,3);


/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, 
incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).*/

INSERT INTO usuarios(id,nombre,edad)
VALUES (4,'Rosa',45),(5,'Pepe',12);

SELECT u.nombre AS Usuario,
       COALESCE(p.nombre,'No ha comprado') AS Producto
FROM usuarios AS u
LEFT JOIN pedidos AS pd
ON pd.id_usuario = u.id
LEFT JOIN productos AS p
ON p.id = pd.id_producto;


/*4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que 
no han realizado ningún pedido (utiliza LEFT JOIN).*/

SELECT u.nombre AS usuario,
       pd.id AS pedido
FROM usuarios AS u
LEFT JOIN pedidos AS pd
ON pd.id_usuario = u.id;

/*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un 
valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE pedidos
ADD COLUMN cantidad INT;

UPDATE pedidos
SET cantidad = 12
WHERE id= 1;

UPDATE pedidos
SET cantidad = 7
WHERE id= 2;

UPDATE pedidos
SET cantidad = 5
WHERE id= 3;

