<?php
$host = "host=localhost";
$port = "port=5432";
$dbname = "dbname=tbd";
$credenciales = "user=galileo password=galileo";
$db = pg_connect("$host $port $dbname $credenciales");
//preguntamos si todos los datos llegaron

if (isset($_POST['action']) && (isset($_POST['nombre'])) && (isset($_POST['apellido'])) &&  (isset($_POST['ciudad'])) && (isset($_POST['contrasena'])) && (isset($_POST['rol'])) && (isset($_POST['funcion'])) && (isset($_POST['correo'])) ){
    $nombreUsuario = $_POST['nombre'];
    $apellidoUsuario = $_POST['apellido'];
    $ciudadUsuario = $_POST['ciudad'];
    $claveUsuario = $_POST['contrasena'];
    $rolUsuario = $_POST['rol'];
    $funcionUsuario = $_POST['funcion'];
    $correoUsuario = $_POST['correo'];
    $fechaActual = date('j-m-y');
//insercion a la tabla usuario
    $sqlUsuario = "INSERT INTO usuario
    (id_usuario,nombre_usuario,apellido_usuario,ciudad,clave_usuario,correo_usuario) VALUES  (default,'$nombreUsuario', '$apellidoUsuario','$ciudadUsuario', '$claveUsuario', '$correoUsuario')";
    $insertarUsuario = pg_query($db,$sqlUsuario);

    $sqlRol = "INSERT INTO rol (id_rol,rol) VALUES (default, '$rolUsuario')";
    $insertarRol = pg_query($db,$sqlRol);

    $sqlFuncion = "INSERT INTO funcion (id_funcion, funcion) VALUES (default, '$funcionUsuario')";
    $insertarFuncion = pg_query($db,$sqlFuncion);

    $sqlIu = "INSERT INTO iu (id_iu,iu) VALUES (default,'$funcionUsuario')";
    $insertarIu = pg_query($db,$sqlIu);

    $sqlUsuarioRol = "INSERT INTO usuario_rol (t_usuario_id,t_id_rol,fecha_inicio,fecha_fin,activo) VALUES (default,default,'$fechaActual','$fechaActual','f')";
    $insertarUsuarioRol = pg_query($db,$sqlUsuarioRol);

    $sqlRolFuncion = "INSERT INTO rol_funcion (t_rol,t_funcion,fecha_inicio,fecha_fin) VALUES (default,default,'$fechaActual','$fechaActual')";
    $insertarFuncionRol = pg_query($db,$sqlRolFuncion);

    $sqlFuncionIu = "INSERT INTO funcion_iu (t_funcion,t_ui) VALUES (default,default)";
    $insertarIuFuncion = pg_query($db,$sqlFuncionIu);

    $cerrarConexion = pg_close($db);
        header('location: ../formulario.html');
    }else {
    echo "uno de los datos no se envio correctamente";
    $cerrarConexion = pg_close($db);
    header('location: ../index.html');
}
?>
