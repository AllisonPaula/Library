<?php
// Datos de conexión a la base de datos
$host = 'localhost';
$dbname = 'libreria';
$username = 'root';
$password = 'Allison.031';


try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}
?>
