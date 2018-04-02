<?php
session_start();
if (isset($_POST['dato'])) {
    $nombre_usuario = "owen";
    $contrasena_usuario = "123";
    if (isset($_POST['nombre']) && ((isset($_POST['contrasena'])))) {
        $nombre = $_POST['nombre'];
        $contrasena = $_POST['contrasena'];

        if (($nombre == $nombre_usuario) && ($contrasena == $contrasena_usuario)) {
            //crear nuestra session
            $_SESSION['nombre_usuario'] = $nombre;
            header("location: usuario.php");
        }else {
            header("location: ../index.html");
            //echo "algo salio mal";
        }
    }else{
        header("location: ../index.html");
        //echo "algo salio mal 2";
    }
}else {
    header("location: ../index.html");
    //echo "algo salio mal 3";
}
?>
