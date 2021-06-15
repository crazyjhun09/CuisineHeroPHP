<?php
    include '../DB/cred.php';
    session_start();
    $con = mysqli_connect($server,$username,$password,$dbname);

    $fID = isset($_SESSION['max_id'])? $_SESSION['max_id'] : null;
    $sel = "SELECT * FROM meat WHERE food_id = '$fID'";
    if($result = $con -> query($sel)){
        $row = $result -> fetch_assoc();
        if(isset($row['food_id'])){
            $fID = 0;
        }
    }

    $queryf = "DELETE FROM food WHERE food_id = '$fID'";

    mysqli_query($con,$queryf);
?>