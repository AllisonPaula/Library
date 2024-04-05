<?php
include 'conexion.php';
try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta a la base de datos
    $stmt = $conn->prepare("SELECT Autor.Nombre, Autor.Apellido, Autor.Nacionalidad, COUNT(*) AS 'Cantidad_Libros' FROM Autor INNER JOIN Libro ON Autor.ID = Libro.Autor_ID GROUP BY Autor.ID");
    $stmt->execute();
    $autores = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Devuelve los resultados como JSON
    echo json_encode($autores);
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>