<?php
session_start();
/*if (isset($_SESSION['nombre_usuario'])) {
    echo "Bienvenido,".$_SESSION['nombre_usuario'];
}else {
    echo "No tiene acceso a esta pagina";
}*/
include 'funcion.php';
verificar_sesion();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="description" content="Sitema De Sesiones Para Investigadores">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
    <meta name="author" content="Owen Wilson">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TBD PROYECTO</title>
    <link rel="icon" href="../image/tbd.ico" type="image/x-icon">
    <link rel="stylesheet" href="../css/materialize.min.css">
    <link href="../css/index.css" rel="stylesheet">
</head>
<body>
<header>
    <div class="navbar-fixed">
        <nav>
            <div class="nav-wrapper #607d8b blue-grey">
                <a href="#!" class="brand-logo"><i class="material-icons blue-text">cloud</i>Sesion</a>
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="index.html" class="tooltipped" data-delay="50" data-tooltip="Pagina Principal"><i class="large material-icons left blue-text">home</i>Inicio</a></li>
                </ul>
            </div>
        </nav>
    </div>
          <ul class="side-nav" id="mobile-demo">
            <li><a href="index.html"><i class="material-icons left red-text">home</i>Inicio</a></li>
          </ul>
</header>
    <form method="POST" action="destruir.php">
      <p class="center-align">
        <button class="waves-effect waves-light btn" type="submit" name="salir"><i class="material-icons right">send</i>Cerrar Sesion </Cerrar></button>
      </p>
    </form>

    <script src="../js/jquery-2.1.4.min.js"></script>
    <script src="../js/materialize.min.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/materialize.min.js"></script>
    <script>
    $(document).ready(function(){
        $(".button-collapse").sideNav();
        $('.tooltipped').tooltip({delay: 50});
        $('.modal').modal();
    });
    </script>
</body>
</html>
