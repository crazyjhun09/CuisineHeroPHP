<?php
session_start();
	include_once "../DB/cred.php";
	$con = mysqli_connect($server,$username,$password,$dbname);
	$food_id = isset($_SESSION['recp-id'])? $_SESSION['recp-id'] : null;
	
		$del = "DELETE meat , veggies, oil, condi, fruit, spice
		FROM meat  INNER JOIN veggies INNER JOIN oil INNER JOIN condi INNER JOIN fruit INNER JOIN spice
		WHERE meat.food_id = veggies.food_id and meat.food_id = oil.food_id and meat.food_id = condi.food_id and meat.food_id = fruit.food_id and meat.food_id = spice.food_id and meat.food_id = '$food_id'";
		mysqli_query($con,$del);
		/*
        $results = mysqli_query($con,$del);
        if ($result) {
            // successfully inserted into database
            $response["success"] = 1;
            $response["message"] = "New user successfully created.";
        
            // echoing JSON response
            echo json_encode($response);
        } else {
            // failed to insert row
            $response["success"] = 0;
            $response["message"] = 'Database error ' . mysqli_errno($con) . ' ' . mysqli_error($con);
        
            // echoing JSON response
            echo json_encode($response);*/
?>