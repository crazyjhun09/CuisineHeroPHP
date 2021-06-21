<?php
	include_once "../DB/cred.php";
	$con = mysqli_connect($server,$username,$password,$dbname);
	$food_id = isset($_SESSION['recp-id'])? $_SESSION['recp-id'] : null;
	
		$del = "DELETE meat, veggies, condi, fruit, spice, oil 
				FROM meat INNER JOIN veggies 
				INNER JOIN condi 
				INNER JOIN fruit 
				INNER JOIN spice 
				INNER JOIN oil
					WHERE meat.food_id = veggies.food_id AND condi.food_id = veggies.food_id AND fruit.food_id = condi.food_id AND spice.food_id = fruit.food_id AND oil.food_id = spice.food_id AND meat.food_id = '$food_id'";
		mysqli_query($con,$del);
?>