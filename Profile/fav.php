<?php
$server = "localhost";
$username = "root";
$password = "";
$dbname = "food";
$email = isset($_SESSION['email'])? $_SESSION['email'] : null;

$con = mysqli_connect($server,$username,$password,$dbname);
$query = "SELECT * FROM like_log WHERE email = '$email'";
if ($result = $con->query($query)){
while($row = $result->fetch_assoc()){
    $food_id = $row['food_id'];
    $queryfav = "SELECT * FROM food WHERE food_id='$food_id'";
    $result1 = $con->query($queryfav);
        while($row1 = $result1->fetch_array()){
            echo '<div class="card col-12 col-md-4">
            <div class="dp">
            <img src="images/'.$row1['authordp'].'">
            </div>
            <div class="usrnm">
            <p>';
            $email1 = $row1['author'];
            $queryname = "SELECT * FROM acc WHERE email='$email1'";
            $result2 = $con->query($queryname);
            while ($row2 = $result2->fetch_array()){
                echo ''.$row2['firstname'].' '.$row2['lastname'].'';
            }
            $result1 = $con->query($queryfav);
            while($row1 = $result1->fetch_array()){
            echo '</p>
            </div>
            <div class="foodpic">
            <img class="img-fluid" src="../Ingredients/Images/'.$row1['food_img'].'">
            </div>
            <div class="foodlabel">
            <h2>'.$row1['food_name'].'</h2>         
            <p>Date Posted: '.substr($row1['regdate'],0,16).'</p>
            </div>
            </div>';
            }
        }
    }
}
?>