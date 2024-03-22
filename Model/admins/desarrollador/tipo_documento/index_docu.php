<?php
session_start();
    require_once("../../../../db/connection.php"); 
    $conexion = new Database();
    $con = $conexion->conectar();
    
?>

<?php 
    
    $sentencia_select=$con->prepare("SELECT * FROM t_documento ORDER BY id_doc ASC");
    
    $sentencia_select->execute();
    $resultado=$sentencia_select->fetchAll();
    
    
    if(isset($_GET['btn_buscar'])) {
        $buscar = $_GET['buscar'];
    
        // Preparar la consulta SQL
        $consulta = $con->prepare("SELECT * FROM t_documento WHERE id_doc LIKE :buscar");
    
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
        <title>Documento</title>
        <link rel="stylesheet" href="../../css/estilos.css">
    </head>
    <body>
        <div class="contenedor">
            <h2>TIPOS DE DOCUMENTOS DE IDENTIDAD</h2>
            <div class="row mt-3">
        <div class="col-md-6">
            <form action="../index.php">
                <input type="submit" value="Regresar" class="btn btn-secondary"/>
            </form>
        </div>
            <div class="barra_buscador">
                <form action="" class="formulario" method="GET">
                    <input type="text" name="buscar" placeholder="Buscar Documento" class="input_text">
                    <input type="submit" class="btn" name="btn_buscar" value="Buscar">
                    <a href="insert_docu.php" class="btn btn_nuevo">Crear Documento de Identidad</a>
                </form>
            </div>
            <table>
                <tr class="head">
                    <td>Id_documento</td>
                    <td>Tipo de Documento</td>
                    <td colspan="2">Acción</td>
                </tr>
                <?php 
                if(isset($_GET['btn_buscar'])) {
                    $buscar = $_GET['buscar'];
                    $consulta = $con->prepare("SELECT * FROM t_documento WHERE id_doc LIKE ?");
                    $consulta->execute(array("%$buscar%"));
                    while ($fila = $consulta->fetch(PDO::FETCH_ASSOC)) {
                ?>
                    <tr>
                        <td><?php echo $fila['id_doc']; ?></td>
                        <td><?php echo $fila['tipo']; ?></td>
                        <td><a href="update_docu.php?id_doc=<?php echo $fila['id_doc']; ?>" class="btn__update">Editar</a></td>
                        <td><a href="delete_docu.php?id_doc=<?php echo $fila['id_doc']; ?>" class="btn__delete">Eliminar</a></td>
                    </tr>
                <?php 
                    }
                } else {
                    // Mostrar todos los registros si no se ha realizado una búsqueda
                    $consulta = $con->prepare("SELECT * FROM t_documento");
                    $consulta->execute();
                    while ($fila = $consulta->fetch(PDO::FETCH_ASSOC)) {
                ?>
                    <tr>
                        <td><?php echo $fila['id_doc']; ?></td>
                        <td><?php echo $fila['tipo']; ?></td>
                        <td><a href="update_docu.php?id_doc=<?php echo $fila['id_doc']; ?>" class="btn__update">Editar</a></td>
                        <td><a href="delete_docu.php?id_doc=<?php echo $fila['id_doc']; ?>" class="btn__delete">Eliminar</a></td>
                    </tr>
                <?php 
                    }
                }
                ?>
            </table>
        </div>
    </body>
    </html>

