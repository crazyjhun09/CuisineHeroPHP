<?php
session_start();
    include '../DB/cred.php';
    $con = mysqli_connect($server,$username,$password,$dbname);
    $email = isset($_SESSION['email'])? $_SESSION['email'] : null;
        $recName = $_POST['recname'];
        $timePrep = $_POST['preptime'];
        $timeCook = $_POST['cooktime'];
        $serveSize = $_POST['serve'];
        $procedure = nl2br($_POST['proce']);
        $nutriValue = nl2br($_POST['nutrval']);
        $ytlink = $_POST['ytlink'];

        $query1 = "SELECT MAX(food_id) AS 'food_id' FROM food";
        $sql1 = $con ->query($query1);
        $row2 = $sql1 ->fetch_assoc();
        $fID = intval($row2['food_id'])+1;

        $insert="INSERT INTO food(food_id, food_name, author, prep_time, cook_time, servings, video_link, proced, nutri_info, likes) 
                    VALUES ('$fID','$recName' ,'$email', '$timePrep', '$timeCook', '$serveSize', '$ytlink', '$procedure', '$nutriValue', '0')";

        $result = mysqli_query($con, $insert);
        $_SESSION['max_id'] = $fID;
?>