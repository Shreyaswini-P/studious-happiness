

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Classes</title>
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
    <h1 >Class</h1>
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
  <form class="abc" action="./aclass.php" method="post">

<label for="">Class ID:</label>
<input type="text"autocomplete="off" name="cid" value="">
<br><br>
<label for="">Class:</label>
 <input type="text" name="c" autocomplete="off" value="">
<br><br>
<label for=""> Section:</label>
 <input type="text" name="s" value="">
<br><br>
<input type="submit" id="submit" name="submit" value="submit">
</form>
</div>

<h2 style="float:left;margin-left:26vw;color:red"><?php
error_reporting(0);
include('../config.php');

$cid=$_POST["cid"];
$c=$_POST["c"];
$s=$_POST["s"];


$query="INSERT INTO class values('$cid',$c,'$s');";

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
