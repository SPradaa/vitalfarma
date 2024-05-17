<?php
session_start();
    require_once("../../../../db/connection.php"); 
    $conexion = new Database();
    $con = $conexion->conectar();
    
?>

<?php 
    
    $sentencia_select=$con->prepare("SELECT * FROM medicamentos ORDER BY nombre ASC");
    
    $sentencia_select->execute();
    $resultado=$sentencia_select->fetchAll();
    
    
    if(isset($_GET['btn_buscar'])) {
        $buscar = $_GET['buscar'];
    
        // Preparar la consulta SQL
        $consulta = $con->prepare("SELECT * FROM medicamentos WHERE nombre LIKE :buscar ORDER BY nombre ASC");
    
        // Asignar valor al parámetro
        $buscar = "%$buscar%";
        
        // Vincular el parámetro
        $consulta->bindParam(':buscar', $buscar, PDO::PARAM_STR);
    
        // Ejecutar la consulta
        $consulta->execute();
    
        // Obtener los resultados
        $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
    
        
    }
    ?>
    
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Medicamentos</title>
        <link rel="stylesheet" href="../../css/estilo.css">
    </head>
    <body>
        <div class="contenedor">
            <h2>MEDICAMENTOS REGISTRADOS</h2>
            <div class="row mt-3">
        <div class="col-md-6">
        <?php if(isset($_GET['btn_buscar'])): ?>
            <form action="index_medicame.php" method="get">
                <input type="submit" value="Regresar" class="btn btn-secondary"/>
            </form>
        <?php else: ?>
            <form action="../modulomedico.php">
                <input type="submit" value="Regresar" class="btn btn-secondary"/>
            </form>
        <?php endif; ?>
        </div>
            <div class="barra_buscador">
                <form action="" class="formulario" method="GET">
                    <input type="text" name="buscar" placeholder="Buscar Medicamento" class="input_text">
                    <input type="submit" class="btn" name="btn_buscar" value="Buscar">
                    <a href="create_medicame.php" class="btn btn_nuevo">Crear Medicamento</a>
                </form>
            </div>
            <table>
                <tr class="head">
                    <td>Nombre</td>
                    <td>Tipo de Medicamento</td>
                    <td>Cantidad</td>
                    <td>Medida Cantidad</td>
                    <td>Laboratorio</td>
                    <td>Fecha_vencimiento</td>
                    <td>Lote</td>
                    <td>Estado</td>
                    <td colspan="2">Acción</td>
                </tr>
                <?php 
                if(isset($_GET['btn_buscar'])) {
                    $buscar = $_GET['buscar'];
                    $consulta = $con->prepare("SELECT * FROM medicamentos, tipo_medicamento, laboratorio, estados
                    WHERE medicamentos.id_cla = tipo_medicamento.id_cla AND medicamentos.id_lab = laboratorio.id_lab
                    AND medicamentos.id_estado = estados.id_estado AND nombre LIKE ? ORDER BY nombre ASC");
                    $consulta->execute(array("%$buscar%"));
                    while ($fila = $consulta->fetch(PDO::FETCH_ASSOC)) {
                ?>
                    <tr>
                        <td><?php echo $fila['nombre']; ?></td>
                        <td><?php echo $fila['clasificacion']; ?></td>
                        <td><?php echo $fila['cantidad']; ?></td>
                        <td><?php echo $fila['medida_cant']; ?></td>
                        <td><?php echo $fila['laboratorio']; ?></td>
                        <td><?php echo $fila['f_vencimiento']; ?></td>
                        <td><?php echo $fila['lote']; ?></td>
                        <td><?php echo $fila['estado']; ?></td>
                        <td><a href="update_medicame.php?id_medicamento=<?php echo $fila['id_medicamento']; ?>" class="btn__update">Editar</a></td>
                        <td><a href="delete_medicame.php?id_medicamento=<?php echo $fila['id_medicamento']; ?>" class="btn__delete">Eliminar</a></td>
                    </tr>
                <?php 
                    }
                } else {
                    // Mostrar todos los registros si no se ha realizado una búsqueda
                    $consulta = $con->prepare("SELECT * FROM medicamentos, tipo_medicamento, laboratorio, estados
                    WHERE medicamentos.id_cla = tipo_medicamento.id_cla AND medicamentos.id_lab = laboratorio.id_lab
                    AND medicamentos.id_estado = estados.id_estado ORDER BY nombre ASC");
                    $consulta->execute();
                    while ($fila = $consulta->fetch(PDO::FETCH_ASSOC)) {
                ?>
                    <tr>
                        <td><?php echo $fila['nombre']; ?></td>
                        <td><?php echo $fila['clasificacion']; ?></td>
                        <td><?php echo $fila['cantidad']; ?></td>
                        <td><?php echo $fila['medida_cant']; ?></td>
                        <td><?php echo $fila['laboratorio']; ?></td>
                        <td><?php echo $fila['f_vencimiento']; ?></td>
                        <td><?php echo $fila['lote']; ?></td>
                        <td><?php echo $fila['estado']; ?></td>
                        <td><a href="update_medicame.php?id_medicamento=<?php echo $fila['id_medicamento']; ?>" class="btn__update">Editar</a></td>
                        <td><a href="delete_medicame.php?id_medicamento=<?php echo $fila['id_medicamento']; ?>" class="btn__delete">Eliminar</a></td>
                    </tr>
                <?php 
                    }
                }
                ?>
            </table>
        </div>
    </body>
    </html>

