<?php
    include '../DB/cred.php';
    $con = mysqli_connect($server,$username,$password,$dbname);

    $fID = isset($_SESSION['max_id'])? $_SESSION['max_id'] : null;

    $queryf = "DELETE FROM food WHERE food_id = '$fID'";

    mysqli_query($con,$queryf);



?>