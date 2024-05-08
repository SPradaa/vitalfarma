<?php
    session_start();
    require_once("../../../../db/connection.php"); 
    $conexion = new Database();
    $con = $conexion->conectar();

    $sql = $con -> prepare ("SELECT * FROM empresas, estados
     WHERE empresas.id_estado = estados.id_estado AND empresas.nit= '".$_GET['id']."'");
    $sql -> execute();
    $usua =$sql -> fetch();
?>

<?php

if(isset($_POST["update"]))
 {
    $nit= $_POST['nit'];
    $empresa= $_POST['empresa'];
    $id_licencia= $_POST['id_licencia'];
    $codigo_unico= $_POST['codigo_unico'];
 
   if ($nit=="" || $empresa=="" || $id_licencia=="" || $codigo_unico=="")
    {
       echo '<script>alert ("EXISTEN DATOS VACIOS");</script>';
       echo '<script>window.location="index_emp.php"</script>';
    }
    else
    {
      $insertSQL = $con->prepare("UPDATE empresas SET empresa = '$empresa', 
      id_licencia = '$id_licencia', codigo_unico = '$codigo_unico'
      WHERE nit = '".$_GET['id']."'");
      $insertSQL -> execute();
      echo '<script> alert("ACTUALIZACIÓN EXITOSA");</script>';
      echo '<script>window.location="index_emp.php"</script>';
      
  } 
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/updateu.css">
    <title>Actualizar Empresa</title>

</head>
<body>
    <div class="formulario">
        <h1>Editar Empresa</h1>
        <form method="POST" name="formreg" autocomplete="off">
            <div class="campos">
                <input type="text" name="nit" pattern="[0-9 ]{10}" title="El nit debe tener solo numeros (10 digitos)" value="<?php echo $usua['nit']?>">
                <input type="text" name="empresa" pattern="[a-zA-Z ]{4,30}" title="La empresa debe tener solo letras" value="<?php echo $usua['empresa']?>">
        
            <input type="text" name="licencia" id="licencia" value="" placeholder="genere una nueva licencia"> <input type="button" onclick="generate()"  value="Generar Licencia"></button>
            </div>
            <div class="campos">
            

            </div>
            
            <br><br>
            <input type="submit" name="update" value="Actualizar">
        </form>
    </div>
    <script>
    function generate() {
        var caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";
        var longitud = 10;
        var nuevaLicencia = Array.from({ length: longitud }, () => caracteres.charAt(Math.floor(Math.random() * caracteres.length))).join('');
        
        // Mostrar la variable en el valor del campo de entrada
        document.getElementById("licencia").value = nuevaLicencia;

    
    }
</script>
</body>
</html>
