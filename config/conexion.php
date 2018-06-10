<?php
require_once 'dbconfig.php';
$dsn = "pgsql:host=$DB_HOST;dbname=$DB_NAME;user=$DB_USERNAME;password=$DB_PASSWORD";
$pid = pg_get_pid($dsn);
try{
// create a PostgreSQL database connection
$conn = new PDO($dsn);
 // display a message if connected to the PostgreSQL successfully
if($conn){
echo "Conexion a  <strong>.$dsn.</strong> todo correctamente!";
}
}catch (PDOException $e){
// report error message
echo $e->getMessage();
}
?>
