<?php
$server = "localhost";
$username = "root";
$password = "";
$dbname = "food";
$email = isset($_SESSION['author'])? $_SESSION['author'] : null;

$con = mysqli_connect($server,$username,$password,$dbname);
$query = "SELECT * FROM acc WHERE email = '$email'";
$queryf = "SELECT * FROM food WHERE author = '$email'";
if ($result = $con->query($queryf)){
while($row = $result->fetch_assoc()){
            echo '<div class="card col-12 col-md-4">
            <a href="javascript:void(0)" class="link" var="'.$row['food_id'].'">
            <div class="foodpic recp-tab">
            <img class="img-fluid" src="../../Ingredients/Images/'.$row['food_img'].'">
            </div>
            <div class="foodlabel">
            <h2>'.$row['food_name'].'</h2>         
            <p>Date Posted: '.substr($row['regdate'],0,16).'</p>
            </div>
            </a>
            </div>
            <form method="post" action="../ingr-transfer.php"name="redirect" class="redirect">
            <input type="hidden" class="post" name="post" value="">
            <input type="submit" style="display: none;">
            </form>';
        }
    }
?>