<?php
include '../DB/cred.php';
$food_id = isset($_SESSION['food_id'])? $_SESSION['food_id'] : null;
$con = mysqli_connect($server,$username,$password,$dbname);
$accEmail = isset($_SESSION['email'])? $_SESSION['email']: null;

$querycom = "SELECT * from comments WHERE food_id='$food_id' ORDER By date Desc";


if($result=$con->query($querycom)){
    while ($row = $result->fetch_assoc()){
        $email = $row['email'];
        $queryacc = "SELECT * from acc WHERE email = '$email'";
        if($result1=$con->query($queryacc)){
            while($row1=$result1->fetch_array()){
        echo '<div class="card commentcard">
        <a href="javascript:void(0)" class="link1" var="'.$row1['id'].'">
        <div class="dp"> <!--profile picture-->
        <img src="../Profile/images/'.$row1['dispic'].'">
        </div>
        <div class="usrnm"> <!--username-->
            <h4>'.$row1['firstname'].' '.$row1['lastname'].'</h4></a>';
            if ($accEmail==$row1['email']){
                echo '<form action="del-com.php" method="POST" id="del"><button class="del-com" form="del"><div>x</div></button>
                    <input type="hidden" name="id" value = '.$row['id'].'>
                </form>';
            }
            }
        }
        echo '<p>'.$row['comment'].'</p>
        </div>
        </div>
        <form method="post" action="../feed_files/to-profile.php" name="redirect1" class="redirect1">
        <input type="hidden" class="post1" name="post1" value="">
        <input type="submit" style="display: none;">
        </form>';
    }
}
?>