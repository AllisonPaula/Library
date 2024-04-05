<?php
include 'conexion.php';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta a la base de datos
    $stmt = $conn->prepare("SELECT Titulo, Autor.Nombre AS Autor, Genero, Paginas FROM Libro JOIN Autor ON Libro.Autor_ID = Autor.ID");
    $stmt->execute();
    $libros = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Devuelve los resultados como JSON
    echo json_encode($libros);
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>