<?php
header('Content-Type: application/json');

include ".\connect.php";


$stmt = $db->prepare("SELECT * FROM products");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);
?>