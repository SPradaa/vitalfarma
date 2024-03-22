<?php

   require_once ("db/connection.php");
   $db = new Database();
   $con = $db ->conectar();
   session_start();

   if (isset($_POST['verificar']))
   { 
       $codigo=$_POST['codigo'];

       $sql= $con -> prepare ("SELECT * FROM usuarios WHERE token='$codigo'");
       $sql -> execute();
       $fila = $sql -> fetchAll(PDO::FETCH_ASSOC);

     if ($fila) {
     echo '<script> alert ("Su codigo ha sido verificado correctamente");</script>';
     $_SESSION['user_id'] = $fila[0]['documento'];
     header("Location: contrasena.php");
     }
     else{
       echo '<script> alert ("El codigo digitado no coincide con el codigo enviado");</script>';
     }
    }
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Verificación de código</title>
<link rel="stylesheet" href="assets/css/codigo.css">
</head>
<body>
<div class="container">
  <h2>Verificación de código</h2>
  <form method="post" name="form1" id="form1"  autocomplete="off"> 
    <label for="codigo">Por favor, ingrese el código que se envió a su correo:</label>
    <input type="text" id="codigo" name="codigo" required>
    <input type="submit" name="verificar" value="verificar">
    <input type="hidden" name="MM_insert" value="formreg">
  </form>
</div>
</body>
</html>
