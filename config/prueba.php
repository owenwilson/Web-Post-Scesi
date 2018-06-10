<?php
$host = "host=localhost";
$port = "port=5432";
$dbname = "dbname=tbd";
$credenciales = "user=galileo password=galileo";
$db = pg_connect("$host $port $dbname $credenciales");

$nombreUsuario = $_POST['nombre'];
$apellidoUsuario = $_POST['apellido'];
$ciudadUsuario = $_POST['ciudad'];
$claveUsuario = $_POST['contrasena'];
$rolUsuario = $_POST['rol'];
$funcionUsuario = $_POST['funcion'];
$correoUsuario = $_POST['correo'];
$fechaActual = date('j-m-y');

if ($rolUsuario === 'administrador') {

    $sqlUsuario = "INSERT INTO usuario (id_usuario,nombre,apellido,ciudad,clave,correo) VALUES (default,'$nombreUsuario','$apellidoUsuario','$ciudadUsuario','$claveUsuario','$correoUsuario')";
    $insertartUsuario = pg_query($db,$sqlUsuario);

    $sqlRolUsuario = "INSERT INTO rol (id_rol,rol) VALUES ('1','$rolUsuario')";
    $insertarRolUsuario = pg_query($db,$sqlRolUsuario);

    $sqlFuncionRol = "INSERT INTO funcion (id_funcion,funcion) VALUES ('1','$rolUsuario')";
    $insertarFuncionRol = pg_query($db,$sqlFuncionRol);

    $sqlIu = "INSERT INTO iu (id_iu,iu) VALUES ('1','$rolUsuario')";
    $insertarIu = pg_query($db,$sqlIu);

    $sqlUsuarioRol = "INSERT INTO usuario_rol (tabla_usuario,tabla_rol,fecha_inicio,fecha_fin,activo) VALUES ('1','1','$fechaActual','$fechaActual','f')";
    $insertarUsuarioRol = pg_query($db,$sqlUsuarioRol);

    $sqlRolFuncion = "INSERT INTO rol_funcion (tabla_rol,tabla_funcion,fecha_inicio,fecha_fin) VALUES ('1','1','$fechaActual','$fechaActual')";
    $insertarRolFuncion = pg_query($db,$sqlRolFuncion);

    $sqlFuncionIu = "INSERT INTO funcion_iu (tabla_funcion,tabla_iu) VALUES ('1','1')";
    $insertartFuncionIu = pg_query($db,$sqlFuncionIu);

    $cerrarConexion = pg_close($db);
        header('location:../formulario.html');


}elseif ($rolUsuario === 'empleado') {
    $sqlUsuario = "INSERT INTO usuario (id_usuario,nombre,apellido,ciudad,clave,correo) VALUES (default,'$nombreUsuario','$apellidoUsuario','$ciudadUsuario','$claveUsuario','$correoUsuario')";
    $insertartUsuario = pg_query($db,$sqlUsuario);

    $sqlRolUsuario = "INSERT INTO rol (id_rol,rol) VALUES ('2','$rolUsuario')";
    $insertarRolUsuario = pg_query($db,$sqlRolUsuario);

    $sqlFuncionRol = "INSERT INTO funcion (id_funcion,funcion) VALUES ('2','$rolUsuario')";
    $insertarFuncionRol = pg_query($db,$sqlFuncionRol);

    $sqlIu = "INSERT INTO iu (id_iu,iu) VALUES ('2','$rolUsuario')";
    $insertarIu = pg_query($db,$sqlIu);

    $sqlUsuarioRol = "INSERT INTO usuario_rol (tabla_usuario,tabla_rol,fecha_inicio,fecha_fin,activo) VALUES ('2','2','$fechaActual','$fechaActual','f')";
    $insertarUsuarioRol = pg_query($db,$sqlUsuarioRol);

    $sqlRolFuncion = "INSERT INTO rol_funcion (tabla_rol,tabla_funcion,fecha_inicio,fecha_fin) VALUES ('2','2','$fechaActual','$fechaActual')";
    $insertarRolFuncion = pg_query($db,$sqlRolFuncion);

    $sqlFuncionIu = "INSERT INTO funcion_iu (tabla_funcion,tabla_iu) VALUES ('2','2')";
    $insertartFuncionIu = pg_query($db,$sqlFuncionIu);

    $cerrarConexion = pg_close($db);
        header('location:../formulario.html');


}elseif ($rolUsuario === 'invitado') {
    $sqlUsuario = "INSERT INTO usuario (id_usuario,nombre,apellido,ciudad,clave,correo) VALUES (default,'$nombreUsuario','$apellidoUsuario','$ciudadUsuario','$claveUsuario','$correoUsuario')";
    $insertartUsuario = pg_query($db,$sqlUsuario);

    $sqlRolUsuario = "INSERT INTO rol (id_rol,rol) VALUES ('3','$rolUsuario')";
    $insertarRolUsuario = pg_query($db,$sqlRolUsuario);

    $sqlFuncionRol = "INSERT INTO funcion (id_funcion,funcion) VALUES ('3','$rolUsuario')";
    $insertarFuncionRol = pg_query($db,$sqlFuncionRol);

    $sqlIu = "INSERT INTO iu (id_iu,iu) VALUES ('3','$rolUsuario')";
    $insertarIu = pg_query($db,$sqlIu);

    $sqlUsuarioRol = "INSERT INTO usuario_rol (tabla_usuario,tabla_rol,fecha_inicio,fecha_fin,activo) VALUES ('3','3','$fechaActual','$fechaActual','f')";
    $insertarUsuarioRol = pg_query($db,$sqlUsuarioRol);

    $sqlRolFuncion = "INSERT INTO rol_funcion (tabla_rol,tabla_funcion,fecha_inicio,fecha_fin) VALUES ('3','3','$fechaActual','$fechaActual')";
    $insertarRolFuncion = pg_query($db,$sqlRolFuncion);

    $sqlFuncionIu = "INSERT INTO funcion_iu (tabla_funcion,tabla_iu) VALUES ('3','3')";
    $insertartFuncionIu = pg_query($db,$sqlFuncionIu);

    $cerrarConexion = pg_close($db);
        header('location:../formulario.html');
}else {
    echo "tenemos un error";
}
?>
