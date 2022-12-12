CREATE TABLE Fabricante (
  id INT IDENTITY(1,1)  PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Producto (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  id_fabricante INT NOT NULL,
  CONSTRAINT FK_Producto_Fabricante FOREIGN KEY (id_fabricante)
	REFERENCES Fabricante (id)
);

INSERT INTO fabricante VALUES('Asus');
INSERT INTO fabricante VALUES('Lenovo');
INSERT INTO fabricante VALUES('Hewlett-Packard');
INSERT INTO fabricante VALUES('Samsung');
INSERT INTO fabricante VALUES('Seagate');
INSERT INTO fabricante VALUES('Crucial');
INSERT INTO fabricante VALUES('Gigabyte');
INSERT INTO fabricante VALUES('Huawei');
INSERT INTO fabricante VALUES('Xiaomi');

INSERT INTO producto VALUES('Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES('Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES('Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES('GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES('GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES('Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES('Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES('Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES('Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES('Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES('Impresora HP Laserjet Pro M26nw', 180, 3);


/*CONSULTAS*/

-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT P.nombre 
	FROM Producto P;


-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT P.nombre, CONCAT('Q.',P.precio) AS precio
	FROM Producto P;


-- 3. Lista todas las columnas de la tabla producto.
SELECT * FROM Producto;


-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT P.nombre, CONCAT('Q.', P.precio) AS Quetzales, 
				 CONCAT('$', CAST(ROUND((P.precio * 7.76),2,1) AS DECIMAL(10,2))) AS Dólares,
				 CONCAT('€', CAST(ROUND((P.precio * 8.05),2,1) AS DECIMAL(10,2))) AS Euros
	FROM Producto P;


-- 5. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(P.nombre) AS nombre, CONCAT('Q.', P.precio) AS precio
	FROM Producto P;


-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(P.nombre) AS nombre, CONCAT('Q.', P.precio) AS precio
	FROM Producto P;


-- 7. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga 
    -- en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT F.nombre, UPPER(SUBSTRING(F.nombre, 1, 2)) AS RESULT 
	FROM Fabricante F;


-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT P.nombre, CONCAT('Q.', ROUND(P.precio,1,2)) AS precio
	FROM Producto P;


-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT P.nombre, CONCAT('Q.', CAST(ROUND(P.precio,0,1) AS DECIMAL(10,0))) AS precio
	FROM Producto P;


-- 11.  Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT F.id, F.nombre
	FROM Fabricante F
		INNER JOIN Producto P
			ON P.id_fabricante = F.id;


-- 12.  Lista el código de los fabricantes que tienen productos 
    -- en la tabla producto, eliminando los códigos que aparecen repetidos
SELECT DISTINCT F.id, F.nombre
	FROM Fabricante F
		INNER JOIN Producto P
			ON P.id_fabricante = F.id;


-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT F.nombre 
	FROM Fabricante F
		ORDER BY F.nombre ASC;


-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT F.nombre 
	FROM Fabricante F
		ORDER BY F.nombre DESC;


-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre 
    -- de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT P.nombre
	FROM Producto P
		ORDER BY P.nombre ASC, P.precio DESC;


-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante
SELECT TOP 5 * FROM PRODUCTO;


-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de 
    -- la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM Fabricante F
	WHERE F.id BETWEEN 4 AND 5;


-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT TOP 1 P.nombre, CONCAT('Q.',P.precio) AS precio
	FROM Producto P
		ORDER BY P.precio ASC;


-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT TOP 1 P.nombre, CONCAT('Q.',P.precio) AS precio
	FROM Producto P
		ORDER BY P.precio DESC;


-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT P.nombre
	FROM Producto P
		WHERE P.id = 2;


-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120.
SELECT P.nombre, CONCAT('Q.', P.precio) as precio
	FROM Producto P
		WHERE P.precio <= 120;


-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 120.
SELECT P.nombre, CONCAT('Q.', P.precio) as precio
	FROM Producto P
		WHERE P.precio >= 120;


-- 24. Lista todos los productos que tengan un precio entre 80 y 300. Sin utilizar el operador BETWEEN.
SELECT P.nombre, CONCAT('Q.', P.precio) as precio
	FROM Producto P
		WHERE P.precio >= 80 AND P.precio <=300;


-- 28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM Producto P
    WHERE P.id IN(1,3,5);


/* CONSULTAS MULTITABLAS */

-- 1.Devuelve una lista con el nombre del producto, precio y nombre de 
        -- fabricante de todos los productos de la base de datos.
SELECT P.nombre, CONCAT('Q.', P.precio) AS precio, F.nombre
	FROM Producto P 
		INNER JOIN Fabricante F
			ON F.id = P.id_fabricante;


-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos 
    -- de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT P.nombre, CONCAT('Q.', P.precio) AS precio, F.nombre
	FROM Producto P 
		INNER JOIN Fabricante F
			ON F.id = P.id_fabricante
		ORDER BY P.nombre ASC;


-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT TOP 1 P.nombre, CONCAT('Q.', P.precio) AS precio, F.nombre
	FROM Producto P
		INNER JOIN Fabricante F
			ON F.id = P.id_fabricante
	ORDER BY P.precio ASC;


-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT TOP 1 P.nombre, CONCAT('Q.', P.precio) AS precio, F.nombre
	FROM Producto P
		INNER JOIN Fabricante F
			ON F.id = P.id_fabricante
	ORDER BY P.precio DESC;
