	<?php
	session_start();
	include '../DB/cred.php';
		$con = mysqli_connect($server,$username,$password,$dbname);
		
			$query1 = "SELECT MAX(food_id) AS 'food_id' FROM food";
			$sql1 = $con ->query($query1);
			$row2 = $sql1 ->fetch_assoc();
			$fID = intval($row2['food_id'])+1;
			$_SESSION['max_id'] = $fID;
		
		$c=1;
		$ingsArray=$_POST["ingArray"];
		$ing = array_merge(...$ingsArray);

		$ingsAmt=$_POST["ingAmt"];
		$amt = array_merge(...$ingsAmt);

		$categ=$_POST["categ"];
		if(!isset($ingsArray)){
			$sql="INSERT INTO ".$categ."(".$categ."_name, ".$categ."_amt, food_id) VALUES (null, null, '$fID')";
			mysqli_query($con,$sql);
		}

		foreach (array_combine($ing, $amt) as $ing => $amt) {


			$ings = strval($ing);
			$amts = strval($amt);

			$sql="INSERT INTO ".$categ."(".$categ."_name, ".$categ."_amt, food_id) VALUES ('$ings', '$amts', '$fID')";
		
			$result = mysqli_query($con,$sql);
			if($result){
				$response["success"] = 1;
				$response["message"] = "New user successfully created.";
			
				// echoing JSON response
				echo json_encode($response);
				}
				else
				{
					$response["success"] = 0;
					$response["message"] = 'Database error ' . mysqli_errno($con) . ' ' . mysqli_error($con);
				
					// echoing JSON response
					echo json_encode($response);
				}
			$sql2="SELECT * FROM ingredients_all WHERE ing_name ='$ings'";
			$result1 = $con -> query($sql2);

			if($result1-> num_rows == 0){
				$sqlInsert = "INSERT INTO ingredients_all (ing_name) VALUE ('$ings')";
			}
		}
?>