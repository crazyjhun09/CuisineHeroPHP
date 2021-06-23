<?php
include '../DB/cred.php';
$email = isset($_SESSION['email'])? $_SESSION['email'] : null;

$con = mysqli_connect($server,$username,$password,$dbname);
$query = "SELECT * FROM acc WHERE email = '$email'";
$queryf = "SELECT * FROM food WHERE author = '$email'";
if ($result = $con->query($queryf)){
while($row = $result->fetch_assoc()){
            echo '<div class="card col-12 col-md-4">
            <a href="javascript:void(0)" class="link" var="'.$row['food_id'].'">
            <div class="foodpic recp-tab">';
            $queryImg = "SELECT * FROM recipe_images WHERE food_id=".$row['food_id']."";
            $resultImg = $con->query($queryImg);
            $rowImg = $resultImg -> fetch_assoc();
            echo'<img class="img-fluid" src="../Ingredients/Images/'.$rowImg['food_img'].'">
            </div>
            <div class="foodlabel">
            <h2>'.$row['food_name'].'</h2>         
            <p>Date Posted: '.substr($row['regdate'],0,16).'</p>
            </div>
            </a>
            <div class="container-fluid">
            <div class="row">
            <div class="col-6 text-center del-tag">
            <button class = "btn recp-opt del-id" data-toggle="modal" data-target=".bd-example-modal-sm" value="'.$row['food_id'].'">Delete</button>
            </div>
            <div class="col-6 text-center">
            <button class = "btn recp-opt edit-recp" value="'.$row['food_id'].'">Edit</button>
            </div>
            </div></div>
            </div>
            <form method="post" action="ingr-transfer.php"name="redirect" class="redirect">
            <input type="hidden" class="post" name="post" value="">
            <input type="submit" style="display: none;">
            </form>';
        }
    }
?>