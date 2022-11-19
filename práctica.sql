-- Crear DB
CREATE DATABASE practica;

-- Conectarse a la DB
\c practica;

-- Crear tablas
/*
CREATE TABLE Origen
(
 Id_origen serial NOT NULL,
 Pais      varchar(50) NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( Id_origen )
);
*/

-- ¿Cuál es la diferencia?

CREATE TABLE Origen (
    Id_origen SERIAL PRIMARY KEY UNIQUE,
    Pais VARCHAR NOT NULL
);

-- ??

CREATE TABLE Color (
    Id_color SERIAL PRIMARY KEY UNIQUE,
    Nombre VARCHAR(25) NOT NULL
);

CREATE TABLE Marca (
    Id_marca SERIAL PRIMARY KEY UNIQUE,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Autos (
    Id_autos SERIAL PRIMARY KEY UNIQUE,
    Id_color INT NOT NULL,
    Id_marca INT NOT NULL,
    Id_origen INT NULL,
    Condicion VARCHAR(50) NULL,
    Year NUMERIC NOT NULL,
    Modelo VARCHAR(50) NOT NULL
);

-- Insertar datos
--
INSERT INTO Origen (Pais) VALUES ('Italia');
INSERT INTO Origen (Pais) VALUES ('Brasil');
INSERT INTO Origen (Pais) VALUES ('México');
INSERT INTO Origen (Pais) VALUES ('Usa');
INSERT INTO Origen (Pais) VALUES ('China');
INSERT INTO Origen (Pais) VALUES ('Corea');
--
INSERT INTO Color (Nombre) VALUES ('Negro');
INSERT INTO Color (Nombre) VALUES ('Blanco');
INSERT INTO Color (Nombre) VALUES ('Azul');
INSERT INTO Color (Nombre) VALUES ('Grafito');
INSERT INTO Color (Nombre) VALUES ('Amarillo');
INSERT INTO Color (Nombre) VALUES ('Naranjo');
INSERT INTO Color (Nombre) VALUES ('Morado');
INSERT INTO Color (Nombre) VALUES ('Verde');
--
INSERT INTO Marca (Nombre) VALUES ('Fiat');
INSERT INTO Marca (Nombre) VALUES ('Dodge');
INSERT INTO Marca (Nombre) VALUES ('Chevrolet');
INSERT INTO Marca (Nombre) VALUES ('Suzuki');
INSERT INTO Marca (Nombre) VALUES ('Hyundai');
INSERT INTO Marca (Nombre) VALUES ('Honda');
INSERT INTO Marca (Nombre) VALUES ('Peugeot');
INSERT INTO Marca (Nombre) VALUES ('Kia');
INSERT INTO Marca (Nombre) VALUES ('Toyota');
INSERT INTO Marca (Nombre) VALUES ('Mitsubishi');
INSERT INTO Marca (Nombre) VALUES ('Mazda');
INSERT INTO Marca (Nombre) VALUES ('Audi');
--
INSERT INTO Autos (Id_color, Id_marca, Id_origen, Condicion, Year, Modelo) VALUES (8, 4, 6, '', 2000, 'Modelo 1');
INSERT INTO Autos (Id_color, Id_marca, Id_origen, Condicion, Year, Modelo) VALUES (4, 1, 1, 'Perfecta', 2012, 'Modelo 2');
INSERT INTO Autos (Id_color, Id_marca, Id_origen, Condicion, Year, Modelo) VALUES (1, 1, 1, 'Normal', 2010, 'Modelo 3');
INSERT INTO Autos (Id_color, Id_marca, Id_origen, Condicion, Year, Modelo) VALUES (3, 2, 3, 'Perfecta', 2015, 'Modelo 1');
INSERT INTO Autos (Id_color, Id_marca, Id_origen, Condicion, Year, Modelo) VALUES (2, 4, 3, 'Normal', 2022, 'Modelo 4');
INSERT INTO Autos (Id_color, Id_marca, Id_origen, Condicion, Year, Modelo) VALUES (2, 3, 3, 'Mala', 2020, 'Modelo 5');
INSERT INTO Autos (Id_color, Id_marca, Id_origen, Condicion, Year, Modelo) VALUES (1, 3, 2, 'Normal', 2015, 'Modelo 1');
INSERT INTO Autos (Id_color, Id_marca, Id_origen, Condicion, Year, Modelo) VALUES (5, 12, 4, 'Normal', 2015, 'Modelo 2');
INSERT INTO Autos (Id_color, Id_marca, Id_origen, Condicion, Year, Modelo) VALUES (4, 12, 5, 'Perfecta', 2011, 'Modelo 6');
INSERT INTO Autos (Id_color, Id_marca, Id_origen, Condicion, Year, Modelo) VALUES (8, 4, 6, 'Bien', 2012, 'Modelo 6');