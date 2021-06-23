<?php
    include '../DB/cred.php';
    session_start();
    $con = mysqli_connect($server,$username,$password,$dbname);
    $email = isset($_SESSION['email'])? $_SESSION['email'] : null;

    $fID = isset($_SESSION['max_id'])? $_SESSION['max_id'] : null;
    $sel = "SELECT * FROM meat WHERE food_id = '$fID'";
    if($result = $con -> query($sel)){
        $row = $result -> fetch_assoc();
        if(isset($row['food_id'])){
            $fID = 0;
        }
    }
    if (isset($_SESSION['max_id'])){
    $queryf = "DELETE FROM food WHERE food_id = '$fID'";
    $sql = "UPDATE acc SET recpno = recpno-1 WHERE email= '$email'";
    mysqli_query($con,$queryf);
    mysqli_query($con,$sql);
    }
    $_SESSION['max_id']= null;
?>