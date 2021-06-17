<?php
include 'cred.php';
$con = mysqli_connect($server,$username,$password,$dbname);
$sel = 'SELECT * FROM acc';
$result = $con->query($sel);
while($row = $result ->fetch_assoc()){
    echo ''.$row['email'].'<br>';
}

?>