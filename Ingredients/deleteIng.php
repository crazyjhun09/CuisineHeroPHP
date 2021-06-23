<?php
session_start();
	include_once "../DB/cred.php";
	$con = mysqli_connect($server,$username,$password,$dbname);
	$food_id = isset($_SESSION['recp-id'])? $_SESSION['recp-id'] : null;
	
		/*$del = "DELETE meat , veggies, oil, condi, fruit, spice, bake
		FROM meat  INNER JOIN veggies INNER JOIN oil INNER JOIN condi INNER JOIN fruit INNER JOIN spice INNER JOIN bake
		WHERE meat.food_id = veggies.food_id and meat.food_id = oil.food_id and meat.food_id = condi.food_id and meat.food_id = fruit.food_id and meat.food_id = spice.food_id and meat.food_id = bake.food_id and meat.food_id = '$food_id'";
		mysqli_query($con,$del);*/
        $delm = "DELETE FROM meat WHERE food_id = '$food_id'";
		mysqli_query($con,$delm);
		$delv = "DELETE FROM veggies WHERE food_id = '$food_id'";
		mysqli_query($con,$delv);
		$delf = "DELETE FROM fruit WHERE food_id = '$food_id'";
		mysqli_query($con,$delf);
		$delo = "DELETE FROM oil WHERE food_id = '$food_id'";
		mysqli_query($con,$delo);
		$delc = "DELETE FROM condi WHERE food_id = '$food_id'";
		mysqli_query($con,$delc);
		$dels = "DELETE FROM spice WHERE food_id = '$food_id'";
		mysqli_query($con,$dels);
		$delb = "DELETE FROM bake WHERE food_id = '$food_id'";
		mysqli_query($con,$delb);
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