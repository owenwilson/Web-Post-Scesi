<?php
//session_start();
function verificar_sesion(){
    if (!isset($_SESSION['nombre_usuario'])) {
        unset($_SESSION);
        header("location: ../index.html");
    }
}
?>
