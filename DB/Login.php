<?php 
session_start();
include 'cred.php';

//POST
$email=$_POST['LogEmail'];
$pw1=$_POST['LogPassword'];


$con = mysqli_connect($server,$username,$password,$dbname);
$ins = "SELECT * from acc where email ='test@gmail.com'";
$result = $con->query($ins);
while ($row = $result ->fetch_assoc()){
if(password_verify($pw1,$row['pass'])){
    $_SESSION['firstname']=$row['firstname'];
    $_SESSION['email']=$row['email'];
    header('location:../feed.php');
}
else{
    header('location:../index.php');
}
}
?>