<?php
    include '../DB/cred.php';
    $con = mysqli_connect($server,$username,$password,$dbname);

    $query1 = "SELECT MAX(food_id) AS 'food_id' FROM food";
    $sql1 = $con ->query($query1);
    $row2 = $sql1 ->fetch_assoc();
    $fID = intval($row2['food_id'])+1;
    if(!isset($fID)){
        $fID = 1;
    }
    $querym = "DELETE FROM meat WHERE                   food_id = '$fID'";
    $queryv = "DELETE FROM veggies WHERE                food_id = '$fID'";
    $queryc = "DELETE FROM condi WHERE                  food_id = '$fID'";
    $queryfh = "DELETE FROM fish WHERE                  food_id = '$fID'";
    $queryo = "DELETE FROM oil WHERE                    food_id = '$fID'";
    $queryft = "DELETE FROM fruit WHERE                 food_id = '$fID'";
    $queryss = "DELETE FROM spice WHERE                 food_id = '$fID'";
    $queryd = "DELETE FROM dairy WHERE                  food_id = '$fID'";
    $queryds = "DELETE FROM dessert WHERE               food_id = '$fID'";
    $querysc = "DELETE FROM soup WHERE                  food_id = '$fID'";
    $queryn = "DELETE FROM nuts WHERE                   food_id = '$fID'";
    $queryb = "DELETE FROM bake WHERE                   food_id = '$fID'";
    $queryi = "DELETE FROM ingredients_all WHERE        food_id = '$fID'";
    mysqli_query($con,$querym);
    mysqli_query($con,$queryv);
    mysqli_query($con,$queryc);
    mysqli_query($con,$queryfh);
    mysqli_query($con,$queryo);
    mysqli_query($con,$queryft);
    mysqli_query($con,$queryss);
    mysqli_query($con,$queryd);
    mysqli_query($con,$queryds);
    mysqli_query($con,$querysc);
    mysqli_query($con,$queryn);
    mysqli_query($con,$queryb);
    mysqli_query($con,$queryi);



?>