<?php
require_once("../../db/connection.php"); 
$db = new Database();
$con = $db->conectar();

if(isset($_POST['medico'])) {
    $medicoSeleccionado = $_POST['medico'];

    // Verificar si el médico está ocupado (estado = 3)
    $sql = $con->prepare("SELECT * FROM medicos WHERE docu_medico = ? AND id_estado = 3");
    $sql->execute([$medicoSeleccionado]);
    $fila = $sql->fetch(PDO::FETCH_ASSOC);

    if ($fila) {
        echo 'ocupado';
    } else {
        // Si el médico está disponible
        // Puedes devolver otro mensaje si lo deseas
        // Por ejemplo: echo 'disponible';
    }
}
?>
