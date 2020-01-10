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
    <title>Insert Teachers</title>
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
    <h1 >Teacher</h1>
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
  <form class="abc" action="./ateacher.php" method="post">

<label for="">Teacher ID:</label>
<input type="text"autocomplete="off" name="tid" value="">
<br><br>
<label for="">Name:</label>
 <input type="text" name="name" autocomplete="off" value="">
<br><br>
<label for=""> Subject:</label>
<select class="" name="sub" style="padding:10px;float:right;">
    <?php  while($row= mysqli_fetch_array($rooms)):;  ?>
    <option value="<?php echo $row[1]; ?>"><?php echo $row[1]; ?></option>
  <?php endwhile; ?>
  </select>
<br><br>
<label for=""> Phone:</label>
 <input type="text" name="phone" value="">
<br><br>
<label for=""> Class:</label>
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

$tid=$_POST["tid"];
$name=$_POST["name"];
$sub=$_POST["sub"];
$phone=$_POST["phone"];
$class=$_POST["class"];



$query="INSERT into teacher values($tid,'$name','$sub',$phone,'$class');";

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
