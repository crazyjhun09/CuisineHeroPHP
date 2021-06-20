<?php
include 'cred.php';
$con = mysqli_connect($server,$username,$password,$dbname);
$sel = 'INSERT INTO  ingredients_all (ing_name) value ("Coconut cream")';
/*$result = $con->query($sel);
while($row = $result ->fetch_assoc()){
    echo ''.$row['email'].'<br>';
}*/
mysqli_query($con,$sel);

?>