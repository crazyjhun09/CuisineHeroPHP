<?php
session_start();
include '../DB/cred.php';
$db = mysqli_connect($server,$username,$password,$dbname);
$msg = "";
$email = isset($_SESSION['email'])? $_SESSION['email'] : null;

$data = $_POST['image'];

$fID = isset($_SESSION['max_id'])? $_SESSION['max_id'] : null;

list($type, $data) = explode(';', $data);
list(, $data) = explode(',', $data);

$data = base64_decode($data);
$imageName = time().'.png';
file_put_contents('../Ingredients/Images/'.$imageName, $data);


$sql = "INSERT INTO recipe_images (food_img, food_id, author) VALUES ('$imageName', '$fID', '$email')";//edit crop image
mysqli_query($db, $sql);
/*$result = mysqli_query($db, $sql);
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
}*/
if (move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
    $msg = "Image uploaded successfully";
}else{
    $msg = "Failed to upload image";
}
?>