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
    $signup = "INSERT INTO acc (firstname,lastname,pass,email,banner,dispic,followno,recpno) VALUES ('$Fname','$Lname','$pw1','$email','defaultban.png','defaultdp.png','0','0')";
    mysqli_query($con, $signup);
    $ins1 = "SELECT * FROM acc WHERE email ='$email' && pass='$pw1'";
    $result1 = $con ->query($ins1);
    while ($NameRes = $result1 -> fetch_assoc()){
    $_SESSION['firstname']=$NameRes['firstname'];
    $_SESSION['email']=$NameRes['email'];
    }
    if ($result1) {
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
        echo json_encode($response);
    }
    header('location:../feed.php');
}
?>