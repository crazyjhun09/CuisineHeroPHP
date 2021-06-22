<?php
include '../DB/cred.php';
session_start();
$db = mysqli_connect($server,$username,$password,$dbname);
$msg = "";
$email = isset($_SESSION['email'])? $_SESSION['email'] : null;
$food_id = isset($_SESSION['recp-id'])? $_SESSION['recp-id'] : null;

$data = $_POST['image'];
if (isset($data)){
$fID = isset($_SESSION['max_id'])? $_SESSION['max_id'] : null;
/*$sqlim = "SELECT * from recipe_images WHERE food_id ='$food_id'";
if ($result = $db->query($sqlim)){
    $row = mysqli_fetch_array($result);
    $prevImg = '../Ingredients/Images/'.$row['food_img'].'';
unlink($prevImg);
}*/
list($type, $data) = explode(';', $data);
list(, $data) = explode(',', $data);

$data = base64_decode($data);
$imageName = time().'.png';
file_put_contents('../Ingredients/Images/'.$imageName, $data);

$sql = "UPDATE `recipe_images` SET `food_img`='$imageName' WHERE food_id = '$food_id'";//edit crop image
$result = mysqli_query($db, $sql);
if ($result) {
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

if (move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
    $msg = "Image uploaded successfully";
}else{
    $msg = "Failed to upload image";
}
}
?>