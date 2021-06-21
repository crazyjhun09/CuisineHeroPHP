<?php
	include_once "../DB/cred.php";
    session_start();
	$con = mysqli_connect($server,$username,$password,$dbname);
    $food_id = $_POST['food_id'];
    $_SESSION['recp-id'] = $food_id;
    header('location:../edit.php');
?>