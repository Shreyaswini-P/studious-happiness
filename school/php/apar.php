<?php
include '../config.php';
$query="SELECT * FROM student";
$rooms=mysqli_query($link,$query);


 ?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Parents</title>
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
    <h1 >Parent</h1>
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
  <form class="abc" action="./apar.php" method="post">

<label for="">Student ID:</label>
<select class="" name="sid" style="padding:10px;float:right;">
    <?php  while($row= mysqli_fetch_array($rooms)):;  ?>
    <option value="<?php echo $row[0]; ?>"><?php echo $row[0]; ?></option>
  <?php endwhile; ?>
  </select>
<br><br>
<label for="">Name:</label>
 <input type="text" name="name" autocomplete="off" value="">
<br><br>
<label for="">Address:</label>
 <input type="text" name="addr" autocomplete="off" value="">
<br><br>
<label for=""> Phone:</label>
 <input type="text" name="phone" value="">
<br><br>

<input type="submit" id="submit" name="submit" value="submit">
</form>
</div>

<h2 style="float:left;margin-left:26vw;color:red"><?php
error_reporting(0);
include('../config.php');

$sid=$_POST["sid"];
$name=$_POST["name"];
$addr=$_POST["addr"];
$phone=$_POST["phone"];



$query="INSERT into parent values($sid,'$name','$addr',$phone);";

if(!mysqli_query($link,$query))
{

}
else {
  echo "Inserted Successfully!!";
}


 ?></h2>
</div>





    <div class="footer">
    <b> Copyrights 2019 </b>
    </div>

</body>
</html>
