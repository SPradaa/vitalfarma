<?php
require '../../../../vendor/autoload.php';
require_once("../../../../db/connection.php");
$db = new Database();
$conectar = $db->conectar();

use Picqer\Barcode\BarcodeGeneratorPNG;

if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "formreg")) {
    $nombre = $_POST['nombre'];
    $clasificacion = $_POST['id_cla'];
    $cantidad = $_POST['cantidad'];
    $cant = $_POST['medida_cant'];
    $laboratorio = $_POST['id_lab'];
    $fecha = $_POST['f_vencimiento'];
    $estado = $_POST['id_estado'];

    $codigo_barras = uniqid() . rand(1000, 9999);

    $generator = new BarcodeGeneratorPNG();
    $codigo_barras_imagen = $generator->getBarcode($codigo_barras, $generator::TYPE_CODE_128);

    file_put_contents(__DIR__ . '/images/' . $codigo_barras . '.png', $codigo_barras_imagen);

    $insertsql = $conectar->prepare("INSERT INTO medicamentos (nombre, id_cla, cantidad, medida_cant, id_lab, f_vencimiento, id_estado, codigo_barras) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $insertsql->execute([$nombre, $clasificacion, $cantidad, $cant, $laboratorio, $fecha, $estado, $codigo_barras]);
    echo '<script>alert("Registro exitoso.");</script>';
    echo '<script>window.location="index_medicame.php"</script>';
    exit();
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Medicamentos</title>
    <link rel="stylesheet" href="">
</head>
<body>

    <div class="login-box">
        <h1>Crear Medicamento</h1>

        <form method="post" name="form1" id="form1" autocomplete="off"> 

            <input type="text" name="nombre" id="nombre" pattern="[a-zA-Z0-9 ]{3,30}" placeholder="Ingrese el nombre del medicamento" title="El nombre debe tener solo letras">

            <select name="id_cla">
                <option value="">Seleccione el Tipo de Medicamento</option>
                <?php
                    $control = $conectar->prepare("SELECT * FROM tipo_medicamento");
                    $control->execute();
                    while ($fila = $control->fetch(PDO::FETCH_ASSOC)) {
                        echo "<option value=" . $fila['id_cla'] . ">" . $fila['clasificacion'] . "</option>";
                    }
                ?>
            </select>

            <input type="text" name="cantidad" id="cantidad" pattern="[0-9a-zA-Z]{4,20}" placeholder="Ingrese la cantidad" title="La cantidad debe tener números y letras">

            <input type="text" name="medida_cant" id="medida_cant" pattern="[0-9a-zA-Z]{5,30}" placeholder="Ingrese la cantidad de medida" title="La cantidad de medida debe tener solo letras y números">

            <select name="id_lab">
                <option value="">Seleccione el laboratorio</option>
                <?php
                    $control = $conectar->prepare("SELECT * FROM laboratorio");
                    $control->execute();
                    while ($fila = $control->fetch(PDO::FETCH_ASSOC)) {
                        echo "<option value=" . $fila['id_lab'] . ">" . $fila['laboratorio'] . "</option>";
                    }
                ?>
            </select>

            <label for="f_vencimiento">Fecha de Vencimiento</label>
            <input type="date" name="f_vencimiento" id="f_vencimiento">

            <br><br>

            <select name="id_estado">
                <option value="">Seleccione el estado del medicamento</option>
                <?php
                    $control = $conectar->prepare("SELECT * FROM estados WHERE id_estado IN (1, 2, 7, 8)");
                    $control->execute();
                    while ($fila = $control->fetch(PDO::FETCH_ASSOC)) {
                        echo "<option value=" . $fila['id_estado'] . ">" . $fila['estado'] . "</option>";
                    }
                ?>
            </select>

            <input type="submit" name="inicio" value="Crear">
            <input type="hidden" name="MM_insert" value="formreg">
        </form>
    </div>
              
</body>
</html>
