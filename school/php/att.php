<?php
include '../config.php';
$query="SELECT * FROM class";
$rooms=mysqli_query($link,$query);
 ?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Time Table</title>
    <link rel="stylesheet" href="../css/astyles.css">
    <style media="screen">
    body
    {
      background-image:url('../1.png');

    }

    </style>
</head>
<body>

  <div class="header">
    <h1 >Time Table</h1>
    <div class="header-right">
      <a class="active" href="../logout.php">Sign Out</a>
    </div>
  </div>

    <div style="overflow:auto;">
      <div class="menu">

          <a href="../index.php" class="active">Home</a>



      </div>

    </div>

<div class="main">
  <div class="forms" style="height:35vh;margin-top:8%;">
  <form class="abc" action="./att.php" method="post" enctype="multipart/form-data">

<label for="">Class ID:</label>
<select class="" name="cid" style="padding:10px;float:right;">
    <?php  while($row= mysqli_fetch_array($rooms)):;  ?>
    <option value="<?php echo $row[0]; ?>"><?php echo $row[0]; ?></option>
  <?php endwhile; ?>
  </select>
  <br><br>
<label for="">Time Table:</label>
 <input type="file" name="image" autocomplete="off" value="">
<br><br>

<input type="submit" id="submit" name="submit" value="submit">
</form>
</div>

<h2 style="float:left;margin-left:26vw;color:red"><?php
$connect = mysqli_connect("localhost", "root", "", "school");

if(isset($_POST["submit"]))
{
  $cid=$_POST["cid"];
     $file = addslashes(file_get_contents($_FILES["image"]["tmp_name"]));
     $query = "INSERT INTO timetable VALUES ('$cid','$file');";
     if(mysqli_query($connect, $query))
     {
          echo '<script>alert("Image Inserted into Database")</script>';
     }
}



?>

</h2>
</div>





    <div class="footer">
    <b> Copyrights 2019 </b>
    </div>

</body>
</html>
