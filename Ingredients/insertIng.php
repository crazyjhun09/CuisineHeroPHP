<?php
	include_once "../DB/cred.php";
	$con = mysqli_connect($server,$username,$password,$dbname);
    $food_id = isset($_SESSION['recp-id'])? $_SESSION['recp-id'] : null;
    $ingsArray=$_POST["ingArray"] ?? null;
    $ing = array_merge(...$ingsArray);

    $ingsAmt=$_POST["ingAmt"];
    $amt = array_merge(...$ingsAmt);

    $categ=$_POST["categ"];
    if(!isset($ingsArray)){
        $sql="INSERT INTO ".$categ."(".$categ."_name, ".$categ."_amt, food_id) VALUES (NULL, NULL, '$food_id')";
        mysqli_query($con,$sql);
    }

    foreach (array_combine($ing, $amt) as $ing => $amt) {


        $ings = strval($ing);
        $amts = strval($amt);

        $sql="INSERT INTO ".$categ."(".$categ."_name, ".$categ."_amt, food_id) VALUES ('$ings', '$amts', '$food_id')";
        
        mysqli_query($con,$sql);

        $sql2="SELECT * FROM ingredients_all WHERE ing_name ='$ings'";
        $result1 = $con -> query($sql2);

        if($result1-> num_rows == 0){
            $sqlInsert = "INSERT INTO ingredients_all (ing_name) VALUE ('$ings')";
            mysqli_query($con,$sqlInsert);
        }
    }
    header('location:../edit.php');
//echo "<script type='text/javascript'>alert('Nice one lods!');</script>";
?>