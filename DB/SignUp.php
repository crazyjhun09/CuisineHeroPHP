<?php 
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "food";

//POST
$Fname=$_POST['firstname'];
$Lname=$_POST['lastname'];
$email=$_POST['email'];
$pw1=$_POST['password'];


$con = mysqli_connect($servername,$username,$password,$dbname);

$ins = "SELECT * from acc where email ='$email'";
$result = mysqli_query($con, $ins);
$idfier = mysqli_num_rows($result);
if($idfier==1){
    echo " Email is already taken.";
}
else{
    $signup = "INSERT into acc (firstname,lastname,pass,email,banner,dispic) values ('$Fname','$Lname','$pw1','$email','1622461284.png','1622462048.png')";
    mysqli_query($con, $signup);
    echo " Registration Successful.";   
}
?>
<html><br><br><a href="../index.php">Go back</a></html>