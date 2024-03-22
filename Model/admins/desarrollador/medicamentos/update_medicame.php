<?php
    session_start();
    require_once("../../../../db/connection.php"); 
    $conexion = new Database();
    $con = $conexion->conectar();

    $sql = $con -> prepare ("SELECT * FROM medicamentos, tipo_medicamento, estados, laboratorio
    WHERE medicamentos.id_cla = tipo_medicamento.id_cla AND medicamentos.id_estado = estados.id_estado AND medicamentos.id_lab = laboratorio.id_lab AND medicamentos.id_medicamento= '".$_GET['id']."'");
    $sql -> execute();
    $usua =$sql -> fetch();
?>

<?php

if(isset($_POST["update"]))
 {
    $nombre= $_POST['nombre'];
    $id_cla= $_POST['id_cla'];
    $cantidad= $_POST['cantidad'];
    $medida_cant= $_POST['medida_cant'];
    $id_lab= $_POST['id_lab'];
    $f_vencimiento= $_POST['f_vencimiento'];
    $lote= $_POST['lote'];
    $id_estado= $_POST['id_estado'];
 
 
   if ( $nombre==""|| $id_cla=="" || $cantidad=="" || $medida_cant=="" || $id_lab=="" || $f_vencimiento=="" || $lote=="" || $id_estado=="")
    {
       echo '<script>alert ("EXISTEN DATOS VACIOS");</script>';
       echo '<script>window.location="index_medicame.php"</script>';
    }
    else
    {
      $insertSQL = $con->prepare("UPDATE medicamentos SET nombre = '$nombre', id_cla = '$id_cla', 
      cantidad = '$cantidad', medida_cant = '$medida_cant', id_lab = '$id_lab', f_vencimiento = '$f_vencimiento', lote= '$lote',
      id_estado = '$id_estado' WHERE id_medicamento = '".$_GET['id']."'");
      $insertSQL -> execute();
      echo '<script> alert("ACTUALIZACIÓN EXITOSA");</script>';
      echo '<script>window.location="index_medicame.php"</script>';
      
  } 
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar</title>
    <link rel="stylesheet" href="../../css/updateu.css">
</head>
<body>
    <div class="formulario">
        <h1>Editar Usuario</h1>
        <form method="POST" name="formreg" autocomplete="off">

            <div class="campos">
                <input type="text" name="id_medicamento" value="<?php echo $usua['id_medicamento']?>" readonly> 
                <input type="text" name="nombre" pattern="[a-zA-Z ]{3,30}" title="El nombre debe tener solo letras" value="<?php echo $usua['nombre']?>">
            </div>
            <select name="id_cla">
            <option value="<?php echo $usua['id_cla']?>"><?php echo $usua['clasificacion']?></option>
            <?php
          
            $control = $con -> prepare ("SELECT * From tipo_medicamento");$control -> execute();
            while ($fila = $control -> fetch(PDO::FETCH_ASSOC))
            {
            echo "<option value=" . $fila['id_cla'] . ">" . $fila['clasificacion'] . "</option>";
            }
            ?>
            </select>
            <div class="campos">
                <input type="text" name="cantidad" pattern="[a-zA-Z0-9 ]{4,20}" title="Debe tener letras Y numeros" value="<?php echo $usua['cantidad']?>">
                <input type="text" name="medida_cant" pattern="[0-9a-zA-Z]{5,30}" title="Debe tener numeros y letras" value="<?php echo $usua['medida_cant']?>">
            </div>
            <select name="id_lab">
            <option value="<?php echo $usua['id_lab']?>"><?php echo $usua['laboratorio']?></option>
            <?php
          
            $control = $con -> prepare ("SELECT * From laboratorio");$control -> execute();
            while ($fila = $control -> fetch(PDO::FETCH_ASSOC))
            {
            echo "<option value=" . $fila['id_lab'] . ">" . $fila['laboratorio'] . "</option>";
            }
            ?>
            </select>
            <div class="campos">
                <input type="text" name="f_vencimiento" value="<?php echo $usua['f_vencimiento']?>">
                <input type="text" name="lote" pattern="[0-9a-zA-Z]{4,8}" title="Debe tener numeros y letras" value="<?php echo $usua['lote']?>">
            </div>
            
            <select name="id_estado">
            <option value="<?php echo $usua['id_estado']?>"><?php echo $usua['estado']?></option>
            <?php
          
            $control = $con -> prepare ("SELECT * From estados where id_estado =1 OR id_estado =2 OR id_estado =7 OR id_estado =8");
            $control -> execute();
            while ($fila = $control -> fetch(PDO::FETCH_ASSOC))
            {
            echo "<option value=" . $fila['id_estado'] . ">" . $fila['estado'] . "</option>";
            }
            ?>
            </select>

            <br><br>
            <input type="submit" name="update" value="Actualizar">
        </form>
    </div>
</body>
</html>