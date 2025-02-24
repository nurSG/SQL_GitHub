--EJERCICIO 1
--1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto).

CREATE TABLE IF NOT EXISTS Clientes (
       id INT PRIMARY KEY,
	   nombre VARCHAR(255),
	   email VARCHAR (255)
);

--2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com".
INSERT INTO public.Clientes(id, nombre, email)
VALUES (1,'Juan','juan@example.com');

--3. Actualizar el email del cliente con id=1 a "juan@gmail.com".

UPDATE public.Clientes
SET email = 'juan@gmail.com'
WHERE id=1;

--4. Eliminar el cliente con id=1 de la tabla "Clientes".
DELETE FROM public.Clientes
WHERE id=1;

/*5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero).*/
CREATE TABLE IF NOT EXISTS Pedidos(
      id INT PRIMARY KEY,
	  cliente_id INT,
	  CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
	  producto VARCHAR(255),
	  cantidad INT
);


--6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.
INSERT INTO public.Pedidos(id, cliente_id, producto, cantidad)
VALUES (1, 1, 'Camiseta', 2);

--7. Actualizar la cantidad del pedido con id=1 a 3.
UPDATE public.Pedidos
SET cantidad=3
WHERE id=1;


--8. Eliminar el pedido con id=1 de la tabla "Pedidos".
DELETE FROM public.Pedidos
WHERE id=1;

/*9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) 
y precio (decimal).*/
CREATE TABLE IF NOT EXISTS Productos (
     id INT PRIMARY KEY,
	 nombre VARCHAR(255),
	 precio DECIMAL
)

--10. Insertar varios productos en la tabla "Productos" con diferentes valores.
INSERT INTO public.Productos(id, nombre, precio)
VALUES (1, 'Ordenador', 800);

INSERT INTO public.Productos(id, nombre, precio)
VALUES (2, 'Cámara', 1200);
INSERT INTO public.Productos(id, nombre, precio)
VALUES (3, 'Cargador', 30.75);
INSERT INTO public.Productos(id, nombre, precio)
VALUES (4, 'Cascos', 20.25);
INSERT INTO public.Productos(id, nombre, precio)
VALUES (5, 'Teléfono', 230.99);


--11. Consultar todos los clientes de la tabla "Clientes".
SELECT *
FROM public.Clientes
--12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.
SELECT *
FROM public.Pedidos AS p
LEFT JOIN public.Clientes AS c
ON c.id=p.cliente_id;


--13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.
SELECT pr.nombre AS producto,
       pr.precio
FROM public.Productos AS pr
WHERE precio > 50;


--14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.
INSERT INTO public.Pedidos(id, producto, cantidad)
VALUES (2,'Ordenador', 7);

INSERT INTO public.Pedidos(id, producto, cantidad)
VALUES (3, 'Cámara', 1);

INSERT INTO public.Pedidos(id, producto, cantidad)
VALUES (4,'Cargador', 12);


SELECT p.producto,
       p.cantidad
FROM public.Pedidos AS p
WHERE cantidad >=5;

--15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".
SELECT c.nombre
FROM public.Clientes AS c
WHERE nombre ILIKE 'A%';

--16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.
INSERT INTO public.Clientes(id, nombre, email)
VALUES (2,'Melodi','melodi@example.com');

INSERT INTO public.Clientes(id, nombre, email)
VALUES (3,'Percy','percy@gmail.com');
INSERT INTO public.Clientes(id, nombre, email)
VALUES (4,'Carlos','c.arlos@yahoo.com');

UPDATE public.Pedidos 
SET cliente_id = 2
WHERE id=2;
UPDATE public.Pedidos 
SET cliente_id = 3
WHERE id=3;
UPDATE public.Pedidos 
SET cliente_id = 4
WHERE id=4;

--------------
SELECT c.nombre AS cliente,
       p.cantidad AS pedidos
FROM public.Clientes AS c
INNER JOIN public.Pedidos AS p
ON p.cliente_id = c.id;

--17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.
SELECT producto,
       cantidad
FROM public.Pedidos


--18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.
ALTER TABLE public.Pedidos
ADD COLUMN fecha DATE;

--19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".

UPDATE public.Pedidos
SET producto= 'Cascos'
WHERE id=1;
INSERT INTO public.Pedidos(id,producto,cantidad)
VALUES(5,'Teléfono', 6);

ALTER TABLE public.Productos
ADD CONSTRAINT nombre UNIQUE(nombre)

ALTER TABLE public.Pedidos
ADD CONSTRAINT FK_producto
FOREIGN KEY (producto) REFERENCES Productos(nombre);


/*20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades 
de los pedidos donde coincida la clave externa.*/
SELECT c.nombre AS Cliente,
       pr.nombre AS Producto,
	   p.cantidad AS Cantidad
FROM public.Clientes AS c
INNER JOIN public.Pedidos AS p
ON p.cliente_id = c.id
INNER JOIN public.Productos AS pr
ON pr.nombre = p.producto;



