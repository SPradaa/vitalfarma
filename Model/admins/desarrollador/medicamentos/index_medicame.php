<?php
    require_once("../../../../db/connection.php"); 
    $conexion = new Database();
    $con = $conexion->conectar();
    session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Medicamentos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        .table-container {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-left: -50px;
            margin-right: -70px;
            margin-top: 40px;
        }
        th, td {
            padding: 12px;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
        }
        thead {
            background-color: #007bff;
            color: white;
        }
        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tbody tr:hover {
            background-color: #e2e2e2;
        }
        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .btn-container .btn {
            width: 48%;
        }
        .text{
            margin-top: -13px;
            text-align: center;
        }

        .btn-btn-success{
            margin-left:70px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h1 class="text">Medicamentos</h1>
    <br>
    <div class="text-center">
    <div class="row mt-3">
        <div class="col-md-6">
            <form action="../modulomedico.php">
                <input type="submit" value="Regresar" class="btn btn-secondary"/>
            </form>
        </div>
        <div class="col-md-6">
            <a href="create_medicame.php" class="btn btn-success"><i class="fas fa-user-plus"></i>Crear Medicamentos</a>
        </div>
    </div>
    <table class="table table-bordered">
        <thead class="table-primary">
            <tr>
                <th>Id_medicamento</th>
                <th>Nombre</th>
                <th>Tipo de Medicamento</th>
                <th>Cantidad</th>
                <th>Medida_cantidad</th>
                <th>Laboratorio</th>
                <th>Fecha_vencimiento</th>
                <th>Lote</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>

            <?php
            $consulta = "SELECT * FROM medicamentos, tipo_medicamento, estados, laboratorio
            WHERE medicamentos.id_cla = tipo_medicamento.id_cla AND medicamentos.id_estado = estados.id_estado AND medicamentos.id_lab = laboratorio.id_lab";
            $resultado = $con->query($consulta);

            while ($fila = $resultado->fetch()) {
                echo '
                <tr>
                    <td>' . $fila["id_medicamento"] . '</td>
                    <td>' . $fila["nombre"] . '</td>
                    <td>' . $fila["clasificacion"] . '</td>
                    <td>' . $fila["cantidad"] . '</td>
                    <td>' . $fila["medida_cant"] . '</td>
                    <td>' . $fila["laboratorio"] . '</td>
                    <td>' . $fila["f_vencimiento"] . '</td>
                    <td>' . $fila["lote"] . '</td>
                    <td>' . $fila["estado"] . '</td>
                    <td>
                        <div class="text-center">
                            <a href="update_medicame.php?id=' . $fila['id_medicamento'] . '" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
                            <a href="delete_medicame.php?id=' . $fila['id_medicamento'] . '" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a>
                        </div>
                    </td>
                </tr>';
            }
            ?>
        </tbody>
    </table>
</div>
</body>
</html>