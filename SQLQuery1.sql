CREATE DATABASE Libreria;
USE Libreria;
GO

-- Crear tabla Autor
CREATE TABLE Autor (
    ID INT PRIMARY KEY,
    Nombre NVARCHAR(50),
	Apellido NVARCHAR(50),
    Nacionalidad NVARCHAR(50)
);

-- Crear índice en la tabla Autor
CREATE UNIQUE INDEX IX_Autor_Nombre ON Autor(Nombre);

-- Crear tabla Libro
CREATE TABLE Libro (
    ID INT PRIMARY KEY,
    Titulo NVARCHAR(100),
    Autor_ID INT,
    Genero NVARCHAR(50),
    Precio DECIMAL(10, 2),
    Stock INT,
    FOREIGN KEY (Autor_ID) REFERENCES Autor(ID)
);

-- Crear índice en la tabla Libro
CREATE INDEX IX_Libro_Autor_ID ON Libro(Autor_ID);

-- Crear tabla Cliente
CREATE TABLE Cliente (
    ID INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    CorreoElectronico NVARCHAR(100),
    Telefono NVARCHAR(15)
);

-- Crear índice en la tabla Cliente
CREATE UNIQUE INDEX IX_Cliente_CorreoElectronico ON Cliente(CorreoElectronico);

-- Crear tabla Pedido
CREATE TABLE Pedido (
    ID INT PRIMARY KEY,
    Cliente_ID INT,
    Fecha DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID)
);

-- Crear tabla Detalle_Pedido
CREATE TABLE Detalle_Pedido (
    Pedido_ID INT,
    Libro_ID INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    FOREIGN KEY (Pedido_ID) REFERENCES Pedido(ID),
    FOREIGN KEY (Libro_ID) REFERENCES Libro(ID),
    PRIMARY KEY (Pedido_ID, Libro_ID)
);

-- Crear índices en la tabla Detalle_Pedido
CREATE INDEX IX_Detalle_Pedido_Pedido_ID ON Detalle_Pedido(Pedido_ID);
CREATE INDEX IX_Detalle_Pedido_Libro_ID ON Detalle_Pedido(Libro_ID);
