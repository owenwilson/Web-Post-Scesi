<?php
session_start();
//include 'conexion.php';
$host = "host=localhost";
$port = "port=5432";
$dbname = "dbname=tbd";
$credenciales = "user=galileo password=galileo";
$db = pg_connect("$host $port $dbname $credenciales");
if (isset($_POST['datos']) && (isset($_POST['nombre'])) && (isset($_POST['contrasena']))) {
    $username = $_POST['nombre'];
    $userpass = $_POST['contrasena'];
    $sql = 
    "SELECT nombre_usuario, clave_usuario FROM sesion_tbd.usuario WHERE nombre_usuario='$username' AND clave_usuario='$userpass'";
    $consulta = pg_query($db,$sql);
    $row = pg_fetch_assoc($consulta);
    if ($username == ($row['nombre_usuario']) && $userpass == ($row['clave_usuario'])) {
        //echo $row['nombre_usuario'];
        //echo $row['clave_usuario'];
        header('location: usuario.php');
    }else {
    header('location: ../index.html');
    //echo "segundo if algo esta mal";
    $cerrarConexion = pg_close($db);
}
}else {
    header('location: ../index.html');
    //echo "primer if datos post no entraron";
}
?>
