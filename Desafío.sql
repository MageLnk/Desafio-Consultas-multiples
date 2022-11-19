-- Creando DB
CREATE DATABASE desafio_gabriel_lopez_170;

-- Conectar a la DB
\c desafio_gabriel_lopez_170;

-- Crear tabla Usuarios
CREATE TABLE Usuarios(
    id SERIAL PRIMARY KEY, 
    email VARCHAR, 
    nombre VARCHAR, 
    apellido VARCHAR, 
    rol VARCHAR NOT NULL DEFAULT 'usuario'
);

-- Insertar información a Usuarios
INSERT INTO Usuarios(email, nombre, apellido, rol) VALUES ('magelink@gmail.com', 'Mage', 'Zhezard', 'administrador');
INSERT INTO Usuarios(email, nombre, apellido, rol) VALUES ('pedrolocuras@gmail.com', 'pedro', 'munoz', 'usuario');
INSERT INTO Usuarios(email, nombre, apellido, rol) VALUES ('mario@gmail.com', 'mario', 'bros', 'usuario'); 
INSERT INTO Usuarios(email, nombre, apellido, rol) VALUES ('mariapaz@gmail.com','maria', 'gonzales', 'usuario');
INSERT INTO Usuarios(email, nombre, apellido, rol) VALUES ('elmo@gmail.com', 'elmo', 'cosquillas', 'usuario');

-- Checkin
SELECT * FROM Usuarios;

-- Posts
CREATE TABLE Posts (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR,
    contenido TEXT,
    fecha_creacion DATE DEFAULT CURRENT_DATE,
    fecha_actualizacion DATE DEFAULT CURRENT_DATE,
    destacado BOOLEAN,
    usuario_id BIGINT
);

-- Insertar posts
INSERT INTO Posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) VALUES('Ola k ase', 'Yo hago','2021-01-01', CURRENT_DATE, true, 1);
INSERT INTO Posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) VALUES('Ola k dice', 'Yo digo','2021-01-03', CURRENT_DATE, true, 1); 
INSERT INTO Posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) VALUES('Ola k ama','Yo amo','2021-04-03', CURRENT_DATE, true, 3);
INSERT INTO Posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) VALUES('Ola k mira','Yo miro','2021-05-03', CURRENT_DATE, false, 3);
INSERT INTO Posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) VALUES('Ola k desea', 'Yo deseo','2021-06-03', CURRENT_DATE, false, NULL);

-- Checkin
SELECT * FROM Posts;

-- Crear tabla Comentarios
CREATE TABLE Comentarios (
    id SERIAL PRIMARY KEY, 
    contenido VARCHAR, 
    fecha_creacion DATE DEFAULT CURRENT_DATE, 
    usuario_id BIGINT, 
    post_id BIGINT
);

-- Insertar comentarios 
INSERT INTO Comentarios (contenido, usuario_id, post_id) VALUES ('comentario 1', 1, 1);
INSERT INTO Comentarios (contenido, usuario_id, post_id) VALUES ('comentario 2', 2, 1);
INSERT INTO Comentarios (contenido, usuario_id, post_id) VALUES ('comentario 3', 3, 1);
INSERT INTO Comentarios (contenido, usuario_id, post_id) VALUES ('comentario 4', 1, 2);
INSERT INTO Comentarios (contenido, usuario_id, post_id) VALUES ('comentario 5', 2, 2);

-- Checkin
SELECT * FROM Comentarios;

-- Cruza los datos de la tabla usuarios y posts mostrando las siguientes columnas: 
-- nombre e email del usuario junto al título y contenido del post.
SELECT nombre, email, Posts.titulo, Posts.contenido FROM Usuarios, Posts 
WHERE Usuarios.id = Posts.usuario_id;

-- Muestra el id, título y contenido de los posts de los administradores. El
-- administrador puede ser cualquier id y debe ser seleccionado dinámicamente.
SELECT Usuarios.id, Posts.titulo, Posts.contenido FROM Usuarios
INNER JOIN Posts ON Usuarios.id = Posts.usuario_id
WHERE Usuarios.rol = 'administrador';

-- Cuenta la cantidad de posts de cada usuario. La tabla resultante debe mostrar el id
-- e email del usuario junto con la cantidad de posts de cada usuario.
SELECT Usuarios.id, Usuarios.email, COUNT(Posts.id) FROM Usuarios
LEFT JOIN Posts ON Usuarios.id = Posts.usuario_id GROUP BY Usuarios.id;

-- Muestra el email del usuario que ha creado más posts. Aquí la tabla resultante tiene
-- un único registro y muestra solo el email.
SELECT Usuarios.email FROM Posts 
INNER JOIN Usuarios ON Posts.usuario_id = Usuarios.id 
GROUP BY Usuarios.email 
ORDER BY Usuarios.email DESC LIMIT 1;

-- Muestra la fecha del último post de cada usuario.
SELECT nombre, MAX(fecha_creacion) FROM (
    SELECT Posts.fecha_creacion, Usuarios.nombre FROM Usuarios 
    JOIN Posts ON Usuarios.id = Posts.usuario_id
    ) 
AS Resultado GROUP BY Resultado.nombre;

-- Muestra el título y contenido del post (artículo) con más comentarios.
SELECT titulo, contenido FROM Posts JOIN (
    SELECT post_id, COUNT(post_id) FROM comentarios 
    GROUP BY post_id 
    ORDER BY COUNT DESC LIMIT 1)
AS Resultado ON Posts.id = Resultado.post_id;

-- Muestra en una tabla el título de cada post, el contenido de cada post y el contenido
-- de cada comentario asociado a los posts mostrados, junto con el email del usuario que lo escribió. 
SELECT Posts.titulo AS titulo_post, Posts.contenido AS contenido_post, Comentarios.contenido AS contenido_comentario, Usuarios.email FROM Posts
JOIN Comentarios ON Posts.id = Comentarios.post_id 
JOIN Usuarios ON Comentarios.usuario_id = Usuarios.id;

-- Muestra el contenido del último comentario de cada usuario. ***
SELECT fecha_creacion, contenido, usuario_id, Usuarios.nombre FROM Comentarios 
JOIN Usuarios ON Comentarios.usuario_id = Usuarios.id 
WHERE Comentarios.fecha_creacion = (
    SELECT MAX(fecha_creacion) FROM Comentarios 
    WHERE usuario_id = Usuarios.id LIMIT 1
);

-- Muestra los emails de los usuarios que no han escrito ningún comentario. 
SELECT Usuarios.email FROM Usuarios 
LEFT JOIN Comentarios ON Usuarios.id = Comentarios.usuario_id 
GROUP BY Usuarios.email 
HAVING COUNT(Comentarios.id) = 0;