<?php
session_start();
$conexion = pg_connect("host=127.0.0.1 port=5432 dbname=sgi user=galileo password=galileo");
if (isset($_POST['nombre_usuario'],$_POST['clave_acceso'],$_POST['Administrador'],$_POST['Usuario'],$_POST['ciuser'])) :
            $usuario = $_POST['nombre_usuario'];
            $clave = $_POST['clave_acceso'];
            $admin = $_POST['Administrador'];
            $usuariorol = $_POST['Usuario'];
            $ci_user = $_POST['ciuser'];
            #$consulta = 'SELECT login, password, tipo_usuario, ci_usuario FROM usuario WHERE login=$usuario ';
            $consulta = 'INSERT INTO usuario (id_usuario, login, password, tipo_usuario, ci_usuario) VALUES (default,'$usuario','$clave','$admin','$usuariorol','$ci_user' )';
            $resultado = pg_query ( $conexion, $consulta ) or die("Error al ingresar datos");
            $numReg = pg_num_rows($resultado);
            if($numReg>0){
                echo "<table border='1' align='center'>
                <tr bgcolor='skyblue'>
                <th>ID-USER</th>
                <th>NOMBRE</th>
                <th>PASSWORD</th>
                <th>TIPO USUARIO</th>
                <th>CI USUARIO</th></tr>";
                while ($fila=pg_fetch_array($resultado)) {
                    echo "<tr><td>".$fila['id_usuario']."</td>";
                    echo "<td>".$fila['login']."</td>";
                    echo "<td>".$fila['password']."</td>";
                    echo "<td>".$fila['tipo_usuario']."</td>";
                    echo "<td>".$fila['ci_usuario']."</td></tr>";
                }
                echo "</table>";
                }
                else
                {
                echo "No hay Registros";
                }
?>
