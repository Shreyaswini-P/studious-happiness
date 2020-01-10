<?php
include '../config.php';
$query="SELECT * FROM subject";
$rooms=mysqli_query($link,$query);
$query1="SELECT * FROM class";
$rooms1=mysqli_query($link,$query1);


 ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Student</title>
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
    <h1 >Student</h1>
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
  <form class="abc" action="./astu.php" method="post">

<label for="">Student ID:</label>
<input type="text"autocomplete="off" name="sid" value="">
<br><br>
<label for="">Name:</label>
 <input type="text" name="name" autocomplete="off" value="">
<br><br>
<label for="">DOB:</label>
 <input type="date" name="dob" autocomplete="off" value="">
<br><br>
<label for="">Address:</label>
 <input type="text" name="addr" autocomplete="off" value="">
<br><br>
<label for="">Class:</label>
<select class="" name="class" style="padding:10px;float:right;">
    <?php  while($row= mysqli_fetch_array($rooms1)):;  ?>
    <option value="<?php echo $row[0]; ?>"><?php echo $row[0]; ?></option>
  <?php endwhile; ?>
  </select>
  <br><br>

<input type="submit" id="submit" name="submit" value="submit">
</form>
</div>

<h2 style="float:left;margin-left:26vw;color:red"><?php
error_reporting(0);
include('../config.php');

$sid=$_POST["sid"];
$name=$_POST["name"];
$dob=$_POST["dob"];
$addr=$_POST["addr"];
$class=$_POST["class"];


$query="INSERT INTO student values($sid,'$name','$dob','$addr','$class');";

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
