<?php
session_start();
include '../DB/cred.php';
$author=$_POST['post1'];
$sel = "SELECT * FROM acc WHERE id = '$author'";
$con = mysqli_connect($server,$username,$password,$dbname);
if($result = $con->query($sel)){
while($row = $result ->fetch_assoc()){
$_SESSION['author']=$row['email'];
}
}
header('location: ../Profile/Visit-Profile/profile-visit.php');
?>