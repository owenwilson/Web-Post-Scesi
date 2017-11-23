<?php
require_once 'dbconfig.php';
$dsn = "pgsql:host=$host;port=5432;dbname=$bd;user=$username;password=$password";
try{
    $conn = new PDO($dsn);
    if($conn){
        echo "Connected to the <strong>$bd</strong> database successfully! ";
    }
}catch (PDOException $e){
    echo $e->getMessage();
}
 ?>
