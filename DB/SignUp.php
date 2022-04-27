<?php 
session_start();
include 'cred.php';
//POST
$Fname=$_POST['firstname'];
$Lname=$_POST['lastname'];
$email=$_POST['email'];
$pw1=$_POST['password'];


$con = mysqli_connect($server,$username,$password,$dbname);

$ins = "SELECT * from acc where email ='$email'";
$result = mysqli_query($con, $ins);
$idfier = mysqli_num_rows($result);
if($idfier==1){
    header('location:../index.php');
}
else{
    $pass = password_hash($pw1, PASSWORD_DEFAULT);
    $signup = "INSERT INTO acc (firstname,lastname,pass,email,banner,dispic,followno,recpno) VALUES ('$Fname','$Lname','$pass','$email','defaultban.png','defaultdp.png','0','0')";
    mysqli_query($con, $signup);
    $ins1 = "SELECT * FROM acc WHERE email ='$email'";
    $result1 = $con ->query($ins1);
    while ($NameRes = $result1 -> fetch_assoc()){
    $_SESSION['firstname']=$NameRes['firstname'];
    $_SESSION['email']=$NameRes['email'];
    }
    header('location:../feed.php');
}
?>