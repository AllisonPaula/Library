<?php
include 'conexion.php'; // Incluye el archivo de conexión

try {
    // Consulta a la base de datos para obtener los comentarios
    $stmt = $conn->query("SELECT Nombre, Comentario FROM Contacto");
    $comentarios = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Devuelve los comentarios como JSON
    echo json_encode($comentarios);
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
