-- Allis password

CREATE DATABASE libreria;
USE libreria;

-- Crear tabla Autor
CREATE TABLE Autor (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    Nacionalidad NVARCHAR(50)
);

-- Crear índice en la tabla Autor
CREATE UNIQUE INDEX IX_Autor_Nombre ON Autor(Nombre);

-- Crear tabla Libro
CREATE TABLE Libro (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo NVARCHAR(100),
    Autor_ID INT,
    Genero NVARCHAR(50),
    Fecha_Publicacion DATE,
    Paginas INT,
    FOREIGN KEY (Autor_ID) REFERENCES Autor(ID)
);

-- Crear índice en la tabla Libro
CREATE INDEX IX_Libro_Autor_ID ON Libro(Autor_ID);

-- Crear tabla Contacto
CREATE TABLE Contacto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre NVARCHAR(50),
    CorreoElectronico NVARCHAR(50),
    Asunto NVARCHAR(100),
    Comentario NVARCHAR(300)
);

-- Crear índice en la tabla Cliente
CREATE UNIQUE INDEX IX_Contacto_CorreoElectronico ON Contacto(CorreoElectronico);

-- Insertar datos en la tabla Autor
INSERT INTO Autor (Nombre, Apellido, Nacionalidad)
VALUES 
    ('Gabriel', 'García Márquez', 'Colombiano'),
    ('Mario', 'Vargas Llosa', 'Peruano'),
    ('J.K.', 'Rowling', 'Británica'),
    ('Paulo', 'Coelho', 'Brasileño'),
    ('Haruki', 'Murakami', 'Japonés'),
    ('Stephen', 'King', 'Estadounidense'),
    ('Agatha', 'Christie', 'Británica'),
    ('Isabel', 'Allende', 'Chilena'),
    ('Arthur', 'Conan Doyle', 'Británico'),
    ('George', 'Orwell', 'Británico');

-- Insertar datos en la tabla Libro
INSERT INTO Libro (Titulo, Autor_ID, Genero, Fecha_Publicacion, Paginas)
VALUES
    ('Cien años de soledad', 1, 'Realismo mágico', '1967-05-30', 480),
    ('La ciudad y los perros', 2, 'Novela', '1963-10-01', 412),
    ('Harry Potter y la piedra filosofal', 3, 'Fantasía', '1997-06-26', 320),
    ('El alquimista', 4, 'Ficción', '1988-01-01', 208),
    ('Tokio Blues', 5, 'Drama', '1987-01-01', 296),
    ('It', 6, 'Terror', '1986-09-15', 1138),
    ('Asesinato en el Orient Express', 7, 'Misterio', '1934-01-01', 256),
    ('La casa de los espíritus', 8, 'Ficción', '1982-01-01', 448),
    ('Sherlock Holmes: Estudio en escarlata', 9, 'Detective', '1887-01-01', 156),
    ('1984', 10, 'Distopía', '1949-06-08', 328);

-- Insertar datos en la tabla Cliente
INSERT INTO Contacto (Nombre, CorreoElectronico, Asunto, Comentario)
VALUES
    ('Juan', 'juan@example.com', 'Referencia','Me gusta la libreria online'),
    ('María','maria@example.com','Referencia','Los libros son muy buenos'),
    ('Pedro','pedro@example.com', 'Comentario','Me gusta la libreria online'),
    ('Laura','laura@example.com', 'Referencia','Me gustan los libros'),
    ('Ana',  'ana@example.com', 'Hola','Excelente');

-- CONSULTAS
select *from contacto;
SELECT Titulo, Autor.Nombre AS Autor, Genero, Paginas FROM Libro JOIN Autor ON Libro.Autor_ID = Autor.ID;
SELECT Autor.Nombre, Autor.Apellido, Autor.Nacionalidad, COUNT(*) AS 'Cantidad_Libros' FROM Autor INNER JOIN Libro ON Autor.ID = Libro.Autor_ID GROUP BY Autor.ID;