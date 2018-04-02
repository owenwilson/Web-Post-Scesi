<?php
session_start();
if (isset($_POST['salir'])) {
    session_destroy();
    header("location: ../index.html");
}else {
    echo "algo salio mal";
}
?>
