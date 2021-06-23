<?php //Ingredients Name
  session_start();
  include_once "DB/cred.php";
  $con = mysqli_connect($server,$username,$password,$dbname);
  /*session_start();
  if(!isset($_SESSION['user']))
  {
    header("Location: ../index.php");
  }*/
  $food_id = isset($_SESSION['recp-id'])? $_SESSION['recp-id'] : null;
  $callFood = "SELECT * FROM food WHERE food_id = '$food_id'";
  $callFood1 = mysqli_query($con, $callFood);
  $editFood = mysqli_fetch_assoc($callFood1); 

  $queryf = "SELECT * FROM food WHERE food_id = '$food_id'";
  $querym = "SELECT * FROM meat WHERE food_id = '$food_id'";
  $queryv = "SELECT * FROM veggies WHERE food_id = '$food_id'";
  $queryc = "SELECT * FROM condi WHERE food_id = '$food_id'";
  $queryo = "SELECT * FROM oil WHERE food_id = '$food_id'";
  $queryft = "SELECT * FROM fruit WHERE food_id = '$food_id'";
  $queryss = "SELECT * FROM spice WHERE food_id = '$food_id'";

	if (isset($_POST['search'])) {
		$response = "";

		$q = $connection->real_escape_string($_POST['q']);

		$sql = $connection->query("SELECT * FROM ingredients_all
				WHERE ing_name LIKE '%$q%'");

		if ($sql->num_rows > 0) {
			$response = "<ul>";
			$prevIng = false;
            $lim=0;
			while ($data = $sql->fetch_assoc()){
                if($lim!=5){
                $lim++;
				$ingName = $data['ing_name'];
				if($prevIng == $ingName){$ingName = ' ';}
            	else{$response .= "<li class='ing-list'>" .$ingName. "</li>";}
            	$prevIng = $data['ing_name'];
			}
        }
			$response .= "</ul>";
		}

		exit($response);
	}
?>
<!DOCTYPE html>
<html lang="en">
<title>Feed - CuisineHero</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<head>
    <link rel="shortcut icon" href="Images/logo white.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.4/croppie.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.4/croppie.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css files\feedstyle.css">
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Krub' rel='stylesheet'>
</head>
<header>
    <nav class="navbar navbar-expand-md" id="banner">
        <div class="container-fluid" id="banner1">
            <a class="navbar-brand" href="feed.php"><img src="Images\logo white.png"></a>
            <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <img src="Images\burjer.png" width="30" height="20">
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link d-block d-sm-block d-md-none" href="feed.php">CuisineHero</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Search/search.php">Search</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Profile/profile.php">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.html">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="DB/Logout.php">Logout</a>
                    </li>
                </ul> 
        </div>
        <p class="navbar-center d-none d-md-block d-lg-block d-xl-block" id="navtext">CuisineHero</p>
    </nav>
</header>
<body>
                    <div id="postform" class="container tab-pane"><br>
                      <div class="row" id="sec3">
                        <div class="col text-center" id="formcol">
                            <h1>Edit Recipe</h1>
                            <form method="POST" action="Profile/profile.php" id="recp-form">
                                <div id="croppie-demo"></div>
                                <label for="recimg"><span class="formlabel">Upload Recipe Picture</span></label><br>
                                <input type="file" id="croppie-input" name="filename" class="text-center">
                                <div class="form-group">
                                    <label for="rec"><span class="formlabel">Recipe Name:</span></label>
                                    <textarea class="form-control" rows="1" name="recname" id="recname" required maxlength="30"><?php echo $editFood['food_name']; ?></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="prep"><span class="formlabel">Preparation Time:</span></label>
                                    <textarea class="form-control" rows="1" name="preptime" id="preptime" required maxlength="15"><?php echo $editFood['prep_time']; ?></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="cookt"><span class="formlabel">Cooking Time:</span></label>
                                    <textarea class="form-control" rows="1" name="cooktime" id="cooktime" required maxlength="15"><?php echo $editFood['cook_time']; ?></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="serv"><span class="formlabel">Serving:</span></label>
                                    <textarea class="form-control" rows="1" name="serve" id="serve" required maxlength="30"><?php echo $editFood['servings']; ?></textarea>
                                </div>
                                <div class="form-group" id="ingrform">
                                    <label for="ingredients"><span class="formlabel">Ingredients:</span></label><br>
                                    <div class="container-fluid">
                                    <div class="row">
                                    <div class="col-md-6 col-12 ingcateg">
                                    <h5 id="Ing-categ"></h5>
                                    <div class="btn-group">
                                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Categories <!--Dito ung Ingredients-->
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#category-btn">Protein/Meat</a>
                                        <a class="dropdown-item" href="#category-btn">Oil/Liquid</a>
                                        <a class="dropdown-item" href="#category-btn">Vegetables</a>
                                        <a class="dropdown-item" href="#category-btn">Fruits</a>
                                        <a class="dropdown-item" href="#category-btn">Spice/Seasonings</a>
                                        <a class="dropdown-item" href="#category-btn">Condiments</a>
                                    </div>
                                    </div>
                                    <div class="nameofingredient text-center">
                                    <input type="text" placeholder="Name of Ingredient" id="name-Ing" autocomplete ="off" maxlength="30">
                                    <div id="response"></div>
                                    </div><br>
                                    
                                    <input type="text" placeholder="Amount" id="amt-Ing" name="search" autocomplete ="off" maxlength="30">
                                    <span class="ex">Example: 1 kg</span><br>
                                    <button id="add-Ing" type="button">Add</button>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <span class="sayoheading">List of Ingredients:</span>
                                        <div class="container-fluid">
                                            <div class="row app-Ings d-flex justify-content-center">
                                              <script>$(document).on('click', 'button.delbtn', function() {
                                                      $(this).closest('sayo').remove();
                                                });
                                              </script>
                                            <?php
                                            if ($result = $con->query($querym)){

    $row=$result->fetch_assoc();
    $check = $row['meat_name'];
      if(isset($check)){
    //echo '<h4 class="col-12 Indention-Ing font-weight-bold">Protein/Meat:</h4>';
    $result = $con->query($querym);
    while($row = $result->fetch_assoc()) {
      $categ = 'meat';
      $meatname = $row["meat_name"];
      $meatamt = $row["meat_amt"];
      echo '<sayo class="ingrds"><button type="button" class="btn delbtn">Del</button><span class ="col-md-4 col-12">'.$categ.'</span><span class ="categs col-md-3 col-12 '.$categ.'">'.$meatname.'</span><span class="col-md-3 col-12 amt-'.$categ.'">'.$meatamt.'</span></sayo>';
    }
  }

}

if ($result = $con->query($queryo)){
    $row=$result->fetch_assoc();
    $check = $row['oil_name'];
      if(isset($check)){
    //echo '<h4 class="col-12 Indention-Ing font-weight-bold">Oil/Liquid:</h4>';
    $result = $con->query($queryo);
    while($row = $result->fetch_assoc()) {
      $categ = 'oil';
      $oilname = $row["oil_name"];
      $oilamt = $row["oil_amt"];
      echo '<sayo class="ingrds"><button type="button" class="btn delbtn">Del</button><span class ="col-md-4 col-12">'.$categ.'</span><span class ="categs col-md-3 col-12 '.$categ.'">'.$oilname.'</span><span class="col-md-3 col-12 amt-'.$categ.'">'.$oilamt.'</span></sayo>';
    }
  }
}


if($result = $con->query($queryv)){
    $row=$result->fetch_assoc();
    $check = $row['veggies_name'];
      if(isset($check)){
  //echo '<h4 class="col-12 Indention-Ing font-weight-bold">Vegetables:</h4>';
  $result = $con->query($queryv);
    while($row = $result->fetch_assoc()) {
      $categ = 'veggies';
      $vegname = $row["veggies_name"];
      $vegamt = $row["veggies_amt"];
      echo '<sayo class="ingrds"><button type="button" class="btn delbtn">Del</button><span class ="col-md-4 col-12">'.$categ.'</span><span class ="categs col-md-3 col-12 '.$categ.'">'.$vegname.'</span><span class="col-md-3 col-12 amt-'.$categ.'">'.$vegamt.'</span></sayo>';
    }
  }
}
if ($result = $con->query($queryft)){
    $row=$result->fetch_assoc();
    $check = $row['fruit_name'];
      if(isset($check)){
    //echo '<h4 class="col-12 Indention-Ing font-weight-bold">Fruits:</h4>';
    $result = $con->query($queryft);
    while($row = $result->fetch_assoc()) {
      $categ = 'fruit';
      $fruitname = $row["fruit_name"];
      $fruitamt = $row["fruit_amt"];
      echo '<sayo class="ingrds"><button type="button" class="btn delbtn">Del</button><span class ="col-md-4 col-12">'.$categ.'</span><span class ="categs col-md-3 col-12 '.$categ.'">'.$fruitname.'</span><span class="col-md-3 col-12 amt-'.$categ.'">'.$fruitamt.'</span></sayo>';
    }
  }
}
if ($result = $con->query($queryss)){
    $row=$result->fetch_assoc();
    $check = $row['spice_name'];
      if(isset($check)){
    //echo '<h4 class="col-12 Indention-Ing font-weight-bold">Spices/Seasonings:</h4>';
    $result = $con->query($queryss);
    while($row = $result->fetch_assoc()) {
      $categ = 'spice';
      $spicename = $row["spice_name"];
      $spiceamt = $row["spice_amt"];
      echo '<sayo class="ingrds"><button type="button" class="btn delbtn">Del</button><span class ="col-md-4 col-12">'.$categ.'</span><span class ="categs col-md-3 col-12 '.$categ.'">'.$spicename.'</span><span class="col-md-3 col-12 amt-'.$categ.'">'.$spiceamt.'</span></sayo>';
    }
  }
}

if($result = $con->query($queryc)){
  $row=$result->fetch_assoc();
  $check = $row['condi_name'];
    if(isset($check)){
  //echo '<h4 class="col-12 Indention-Ing font-weight-bold">Condiments:</h4>';
  $result = $con->query($queryc);
    while($row = $result->fetch_assoc()) {
      $categ = 'condi';
      $condiname = $row["condi_name"];
      $condiamt = $row["condi_amt"];
      echo '<sayo class="ingrds"><button type="button" class="btn delbtn">Del</button><span class ="col-md-4 col-12">'.$categ.'</span><span class ="categs col-md-3 col-12 '.$categ.'">'.$condiname.'</span><span class="col-md-3 col-12 amt-'.$categ.'">'.$condiamt.'</span></sayo>';
    }
  }
}
?><!--Ingredients will go here-->
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                  </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="procedures"><span class="formlabel">Procedures:</span></label>
                                    <textarea class="form-control" rows="5" name="proce" id="proce" required><?php echo strip_tags($editFood['proced']); ?></textarea>
                                  </div>
                                  <div class="form-group">
                                    <label for="nutri"><span class="formlabel">Nutritional Value (Optional):</span></label>
                                    <textarea class="form-control" rows="5" name="nutrval" id="nutrval"> <?php echo strip_tags($editFood['nutri_info']); ?></textarea>
                                  </div>
                                  <div class="form-group">
                                    <label for="ytlink"><span class="formlabel">Youtube Link Tutorial (Optional): (Right-click video and choose "Copy embed code")</span></label>
                                    <textarea class="form-control" rows="1" name="ytlink" id="ytlink"><?php echo $editFood['video_link']; ?></textarea>
                                  </div>
                                  <div class="d-flex justify-content-center">
                                  <input type="checkbox" name="checkbox" id="checkbox"><span class="disclaimer">Please be sure of legitimacy, any form of misinformation will result to account termination.</span><br>
                                  </div><br>
                                  <button type="submit" class="btn croppie-upload" id="postbtn" name="btnPost"><span class="posttxt">Post your Recipe</span></button>
                              </form>
                        </div>
                        
                      </div>
                    </div>
                </div>
            </div>    
</body>
</html>
<script>
window.onload = function() {
   var addPost = localStorage.getItem("active");
   if (addPost == 1){
    setTimeout(function(){

$("#addPost").click();


},500);

    localStorage.setItem("active",0);
   }
}

$('div').scroll(function(){
    if(!$("button.navbar-toggler").hasClass('collapsed')){
        $('button.navbar-toggler').click();
    }
});
var cl_categ;
$(".link").click(function() {
var link = $(this).attr('var');
$('.post').attr("value",link);
$('.redirect').submit();
});
$(".link1").click(function() {
var link = $(this).attr('var');
$('.post1').attr("value",link);
$('.redirect1').submit();
});

$(document).on('click', 'a.dropdown-item', function () {
    var category = $(this).text();
    $('#Ing-categ').html(category);
});
$(document).on('click', 'button#add-Ing', function () {
    var category = $('h5#Ing-categ').text();
    if(category.length == 12){
        cl_categ = 'meat';
    }
    else if (category.length == 10){
        if (category == 'Oil/Liquid'){
            cl_categ = 'oil';
        }
        else if (category == 'Vegetables'){
            cl_categ = 'veggies';
        }
        else {
            cl_categ = 'condi';
        }
    }
    else if (category.length == 6){
        cl_categ ='fruit';
    }
    else if (category.length == 16){
        cl_categ ='spice';
    }
    else{
        cl_categ = null;
        alert('Please pick a category');
    }
    var ing = $('#name-Ing').val();
    var ing_amt = $('#amt-Ing').val();
    if(ing.length>0 && ing_amt.length>0 && cl_categ.length>0){
        $('.app-Ings').append('<sayo class="ingrds"><button type="button" class="btn delbtn">Del</button><span class ="col-md-4 col-12">'+category+'</span><span class ="categs col-md-3 col-12 '+cl_categ+'">'+ing+'</span><span class="col-md-3 col-12 amt-'+cl_categ+'">'+ing_amt+'</span></sayo>');
    }//Dito ung appending ingredients
    else {
        alert('Please fill-up the name of ingredient and the amount.');
    }
  $(document).on('click', 'button.delbtn', function() {
  $(this).closest('sayo').remove();
});

});
$(document).ready(function () {
   $("#name-Ing").keyup(function () {
       var query = $("#name-Ing").val();

       if (query.length > 0) {
          $.ajax(
                {
                 url: 'feed.php',
                  method: 'POST',
                  data: {
                       search: 1,
                       q: query
                  },
                  success: function (data) {
                     $("#response").html(data);
                 },
                 dataType: 'text'
             }
         );
     }
     else{
          $("#response").html("");
      }
  });
  $(document).on('click', 'li.ing-list', function () {
                    var recipe = $(this).text();
                        $('#name-Ing').val(recipe);
                        $('#response').html("");
    });
});

    $("#checkbox").change(function() {
    if (this.checked){
        if ($('#recname').val().length>0 && $('#cooktime').val().length>0 && $('#preptime').val().length>0 && $('#serve').val().length>0 && $('#proce').val().length>0 && $('#checkbox').prop('checked')){
            $('button#postbtn').prop('disabled', false);
        }
        else{
            $('button#postbtn').prop('disabled', true);
        }
        $("textarea").prop('disabled', true);
        var recname = $("#recname").val();
        var cooktime = $("#cooktime").val();
        var preptime = $("#preptime").val();
        var serve = $("#serve").val();
        var proce = $("#proce").val();
        var nutrval = $("#nutrval").val();
        var ytlink = $("#ytlink").val();

        $.ajax({ 
        url: "feed_files/foodEdit.php", 
        type: "POST", 
        data: { 'recname' : recname, 'cooktime':cooktime, 'preptime' : preptime, "serve":serve, "proce":proce, "nutrval":nutrval, "ytlink":ytlink}, 
        success: function(data) {   
            //alert(data);
        }    
     });
    
    $('button#add-Ing').prop('disabled',true);
    $('button#add-Ing').html('Cannot Add');
    }
    else{
        $.ajax({ 
        url: "feed_files/delete.php", 
        type: "POST"
     });
     $('button#postbtn').prop('disabled', true);
    $('button#add-Ing').prop('disabled',false);
    $('button#add-Ing').html('Add');
    $("textarea").prop('disabled', false);
    }
});
$(window).on('beforeunload', function(){
        $.ajax({ 
        url: "feed_files/delete.php", 
        type: "POST"
});
});


$("#recp-form").submit(function() {
    $.ajax({ 
        url: "Ingredients/deleteIng.php", 
        type: "POST", 
        data: {}, 
        success: function(data) {   
            //alert(data);
        }    
     });
    var meatArray = [];var meatAmt = [];
    var oilArray = [];var oilAmt = [];
    var vegArray = [];var vegAmt = [];
    var fruitArray = [];var fruitAmt = [];
    var spiceArray = [];var spiceAmt = [];
    var condiArray = [];var condiAmt = [];

    $("sayo.ingrds").each(function() {
        var ingredients = [];
        var amounts = [];
        var ingData = $(this).find('span.meat');
        var amtData = $(this).find('span.amt-meat');
        if (ingData.length > 0 && amtData.length > 0) {
             ingData.each(function() { ingredients.push($(this).text()); });
             amtData.each(function() { amounts.push($(this).text()); });
             meatArray.push(ingredients);
             meatAmt.push(amounts);
        }
     });
     $.ajax({ 
        url: "Ingredients/insertIng.php", 
        type: "POST", 
        data: { 'ingArray' : meatArray, 'categ' : "meat", 'ingAmt' : meatAmt}, 
        success: function(data) {   
            //alert(data);
        }    
     });


    $("sayo.ingrds").each(function() {
        var ingredients = [];
        var amounts = [];
        var ingData = $(this).find('span.oil');
        var amtData = $(this).find('span.amt-oil');
        if (ingData.length > 0 && amtData.length > 0) {
             ingData.each(function() { ingredients.push($(this).text()); });
             amtData.each(function() { amounts.push($(this).text()); });
             oilArray.push(ingredients);
             oilAmt.push(amounts);
        }
     });
    
    $.ajax({ 
        url: "Ingredients/insertIng.php", 
        type: "POST", 
        data: { 'ingArray' : oilArray, 'categ':"oil", 'ingAmt' : oilAmt}, 
        success: function(data) {   
            //alert(data);
        }    
     });

    $("sayo.ingrds").each(function() {
        var ingredients = [];
        var amounts = [];
        var ingData = $(this).find('span.veggies');
        var amtData = $(this).find('span.amt-veggies');
        if (ingData.length > 0 && amtData.length > 0) {
             ingData.each(function() { ingredients.push($(this).text()); });
             amtData.each(function() { amounts.push($(this).text()); });
             vegArray.push(ingredients);
             vegAmt.push(amounts);
        }
     });
    
    $.ajax({ 
        url: "Ingredients/insertIng.php", 
        type: "POST", 
        data: { 'ingArray' : vegArray, 'categ':"veggies", 'ingAmt' : vegAmt}, 
        success: function(data) {   
            //alert(data);
        }    
     });

    $("sayo.ingrds").each(function() {
        var ingredients = [];
        var amounts = [];
        var ingData = $(this).find('span.fruit');
        var amtData = $(this).find('span.amt-fruit');
        if (ingData.length > 0 && amtData.length > 0) {
             ingData.each(function() { ingredients.push($(this).text()); });
             amtData.each(function() { amounts.push($(this).text()); });
             fruitArray.push(ingredients);
             fruitAmt.push(amounts);
        }
     });
    
    $.ajax({ 
        url: "Ingredients/insertIng.php", 
        type: "POST", 
        data: { 'ingArray' : fruitArray, 'categ':"fruit", 'ingAmt' : fruitAmt}, 
        success: function(data) {   
            //alert(data);
        }    
     });

    $("sayo.ingrds").each(function() {
        var ingredients = [];
        var amounts = [];
        var ingData = $(this).find('span.spice');
        var amtData = $(this).find('span.amt-spice');
        if (ingData.length > 0 && amtData.length > 0) {
             ingData.each(function() { ingredients.push($(this).text()); });
             amtData.each(function() { amounts.push($(this).text()); });
             spiceArray.push(ingredients);
             spiceAmt.push(amounts);
        }
     });
    
    $.ajax({ 
        url: "Ingredients/insertIng.php", 
        type: "POST", 
        data: { 'ingArray' : spiceArray, 'categ':"spice", 'ingAmt' : spiceAmt}, 
        success: function(data) {   
            //alert(data);
        }    
     });

    $("sayo.ingrds").each(function() {
        var ingredients = [];
        var amounts = [];
        var ingData = $(this).find('span.condi');
        var amtData = $(this).find('span.amt-condi');
        if (ingData.length > 0 && amtData.length > 0) {
             ingData.each(function() { ingredients.push($(this).text()); });
             amtData.each(function() { amounts.push($(this).text()); });
             condiArray.push(ingredients);
             condiAmt.push(amounts);
        }
     });
    
    $.ajax({ 
        url: "Ingredients/insertIng.php", 
        type: "POST", 
        data: { 'ingArray' : condiArray, 'categ':"condi", 'ingAmt' : condiAmt}, 
        success: function(data) {   
            //alert(data);
        }    
     });   
    });
    var croppieDemo = $('#croppie-demo').croppie({
            enableOrientation: true,
            viewport: {
                width: 266.7,
                height: 366.7,
            },
            boundary: {
                width: 300,
                height: 400
            }
        });

        $('#croppie-input').on('change', function () { 
            var reader = new FileReader();
            reader.onload = function (e) {
                croppieDemo.croppie('bind', {
                    url: e.target.result
                });
            }
            reader.readAsDataURL(this.files[0]);
        });

        $('#recp-form').submit(function (ev) {
            croppieDemo.croppie('result', {
                type: 'canvas',
                size: {width: 400,height: 550,}
            }).then(function (image) {
                var ext = $('#croppie-input').val().split('.').pop().toLowerCase();
                if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
                //alert('Invalid form input!');
                }
                else {
                $.ajax({
                    url: "feed_files/uploadUpdate.php",
                    type: "POST",
                    data: {
                        "image" : image
                    },
                    success: function(data) {   
                    //alert(data);
                    }
                });
            }
            });
        });
        $('button#postbtn').prop('disabled', true);
        $('textarea').keyup(function(){    
        if ($('#recname').val().length>0 && $('#cooktime').val().length>0 && $('#preptime').val().length>0 && $('#serve').val().length>0 && $('#proce').val().length>0 && $('#checkbox').prop('checked') && $("#croppie-input").val().length>0){
            $('button#postbtn').prop('disabled', false);
        }
        else{
            $('button#postbtn').prop('disabled', true);
        }
    });


</script>
<style>
    #postform{
        margin-top: 60px;
    }
</style>