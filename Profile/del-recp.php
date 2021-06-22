<?php
	session_start();
	include_once "../DB/cred.php";
	$con = mysqli_connect($server,$username,$password,$dbname);
	$email = isset($_SESSION['email'])? $_SESSION['email'] : null;
    $food_id = $_POST['food_id'];
	
		$del = "DELETE meat , veggies, oil, condi, fruit, spice
		FROM meat  INNER JOIN veggies INNER JOIN oil INNER JOIN condi INNER JOIN fruit INNER JOIN spice
		WHERE meat.food_id = veggies.food_id and meat.food_id = oil.food_id and meat.food_id = condi.food_id and meat.food_id = fruit.food_id and meat.food_id = spice.food_id and meat.food_id = '$food_id'";
		mysqli_query($con,$del);
        $del1= "DELETE FROM `food` WHERE food_id = '$food_id'";
        mysqli_query($con,$del1);
		$sqlim = "SELECT * from recipe_images WHERE food_id ='$food_id'";
		if ($result = $con->query($sqlim)){
    	$row = mysqli_fetch_array($result);
    	$prevImg = '../Ingredients/Images/'.$row['food_img'].'';
		unlink($prevImg);
		}
		$del2= "DELETE FROM `recipe_images` WHERE food_id ='$food_id'";
		mysqli_query($con,$del2);
		$sql = "UPDATE acc SET recpno = recpno-1 WHERE email= '$email'";
        mysqli_query($con,$sql);
?>