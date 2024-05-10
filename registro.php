<?php

   require_once ("db/connection.php");
   $db = new Database();
   $con = $db ->conectar();
   session_start();
?>

<?php

   if ((isset($_POST["MM_insert"]))&&($_POST["MM_insert"]=="formreg"))
   {
      $documento= $_POST['documento'];
      $id_doc= $_POST['id_doc'];
      $nombre= $_POST['nombre'];
      $apellido= $_POST['apellido'];
      $nit= $_POST['nit'];
      $id_rh= $_POST['id_rh'];
      $telefono= $_POST['telefono'];
      $correo= $_POST['correo'];
      $id_ciudad= $_POST['id_ciudad'];
      $direccion=$_POST['direccion'];
      $clave= $_POST['password'];
      $id_rol= 5;
      $estado= 4;

      $sql= $con -> prepare ("SELECT * FROM usuarios WHERE documento='$documento'");
      $sql -> execute();
      $fila = $sql -> fetchAll(PDO::FETCH_ASSOC);
 
      if ($fila){
         echo '<script>alert ("EL DOCUMENTO YA EXISTE //CAMBIELO//");</script>';
         echo '<script>window.location="registro.php"</script>';
      }
      else
   
     if ($documento=="" || $id_doc=="" || $nombre=="" || $apellido=="" || $id_rh=="" || $telefono=="" || $correo=="" || $id_ciudad=="" || $direccion=="" || $clave=="" || $id_rol=="")
      {
         echo '<script>alert ("EXISTEN DATOS VACIOS");</script>';
         echo '<script>window.location="registro.php"</script>';
      }
      else
      {
        $pass_cifrado=password_hash($clave,PASSWORD_DEFAULT,array("pass"=>12));
        $insertSQL = $con->prepare("INSERT INTO usuarios(documento, id_doc, nombre, apellido, id_rh, telefono, correo, id_ciudad, direccion, password, id_rol, id_estado, nit) VALUES('$documento', '$id_doc', '$nombre', '$apellido',  '$id_rh', '$telefono', '$correo', '$id_ciudad', '$direccion', '$pass_cifrado', '$id_rol', '$estado', '$nit')");
        $insertSQL -> execute();
        echo '<script> alert("REGISTRO EXITOSO");</script>';
        echo '<script>window.location="login.html"</script>';
        
    } 
}
    ?>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro usuario</title>
    <link rel="stylesheet" href="assets/css/registros.css">
</head>
<body>

<div class="regresar">
    <button onclick="goBack()" class="return">
        <span class="btxt">Regresar</span><i class="animate"></i>
    </button>
        
</div>

    <div class="login-box">
        <h1>REGISTRO USUARIO</h1>

        <form method="post" name="form1" id="form1"  autocomplete="off"> 

        <div class="row">
        <select name="id_doc">
                <option value ="">Seleccione el Tipo de Documento</option>
                
                <?php
                    $control = $con -> prepare ("SELECT * from t_documento");
                    $control -> execute();
                while ($fila = $control->fetch(PDO::FETCH_ASSOC)) 
                {
                    echo "<option value=" . $fila['id_doc'] . ">"
                     . $fila['tipo'] . "</option>";
                } 
                ?>
            </select>
        
            <input type="text" name="documento" id="documento" pattern="[0-9]{8,11}" placeholder="Digite su Documento" title="El documento debe tener solo números de 8 a 10 dígitos" required>
            </div>

            <div class="row">
            <input type="text" name="nombre" id="nombre" pattern="[a-zA-Z ]{3,30}" placeholder="Ingrese su Nombre" title="El nombre debe tener solo letras" required>

            <input type="text" name="apellido" id="apellido" pattern="[a-zA-ZÑñ ]{4,30}" placeholder="Ingrese su Apellido" title="El apellido debe tener solo letras">
            </div>

            <div class="row">
            <select name="nit">
                <option value ="">Seleccione el Tipo de EPS</option>
                
                <?php
                    $control = $con -> prepare ("SELECT * from empresas");
                    $control -> execute();
                while ($fila = $control->fetch(PDO::FETCH_ASSOC)) 
                {
                    echo "<option value=" . $fila['nit'] . ">"
                     . $fila['empresa'] . "</option>";
                } 
                ?>
            </select>

            <select name="id_rh">
                <option value ="">Seleccione el Tipo de Sangre</option>
                
                <?php
                    $control = $con -> prepare ("SELECT * from rh");
                    $control -> execute();
                while ($fila = $control->fetch(PDO::FETCH_ASSOC)) 
                {
                    echo "<option value=" . $fila['id_rh'] . ">"
                     . $fila['rh'] . "</option>";
                } 
                ?>
            </select></div>

            <div class="row">
            <input type="text" name="telefono" id="telefono" pattern="[0-9]{10}" placeholder="Ingrese su Telefono" title="El telefono debe tener solo numeros (10 digitos)">

            <input type="text" name="correo" id="correo" pattern="[0-9a-zA-Z.@]{7,30}" placeholder="Ingrese su Correo" title="El correo debe tener minimo 10 letras y numeros">
            </div>

            <div class="row">
            <select name="id_ciudad">
                <option value ="">Seleccione la Ciudad de Residencia</option>
                
                <?php
                    $control = $con -> prepare ("SELECT * from ciudad");
                    $control -> execute();
                while ($fila = $control->fetch(PDO::FETCH_ASSOC)) 
                {
                    echo "<option value=" . $fila['id_ciudad'] . ">"
                     . $fila['ciudad'] . "</option>";
                } 
                ?>
            </select>

            <input type="text" name="direccion" id="direccion" pattern="[a-zA-Z0-9#.-]{5,30}" placeholder="Ingrese la dirección">
            </div>

            <div class="row">
             <input type="password" name="password" id="password" pattern="[0-9A-Za-z]{8,20}" placeholder="Ingrese la Contraseña" title="La contraseña puede tener numeros o letras minimo 4 caracteres">
            </div>
             <br><br>

            
             <input type="submit" name="validar" value="Registrarme">
            <input type="hidden" name="MM_insert" value="formreg">
            </form>
    </div>

    <script>
        function goBack() {
            window.location.href = 'login.html';
        }
    </script>
              
</body>
</html>