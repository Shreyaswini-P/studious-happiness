<?php
include '../config.php';
$query="SELECT * FROM student";
$rooms=mysqli_query($link,$query);
 ?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
    <link rel="stylesheet" href="../css/dstyles.css">
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
      <a class="active" href="logout.php">Sign Out</a>
    </div>
  </div>

<div style="overflow:auto">
 <div class="menu">

     <a href="../index.php" class="active">Home</a>



 </div>
</div>


      <div class="main">
        <div class="forms" style="height:9vw;width:200px;">
          <form class="" action="./dstu.php" method="post">

          <label for="">sid:</label>
        <select class="" name="sid" style="padding:10px;float:right;">
            <?php  while($row= mysqli_fetch_array($rooms)):;  ?>
            <option value="<?php echo $row[0]; ?>"><?php echo $row[0]; ?></option>
          <?php endwhile; ?>
          </select>
          <br><br><br>
        <input type="submit" id="submit" name="submit" value="submit">


          </form>

        </div>

        <h2 style="float:left;margin-left:26vw;color:red">
          <?php
          if(isset($_POST["submit"]))
          {
          error_reporting(0);
          $sid=$_POST["sid"];
          $query="DELETE FROM student WHERE sid=$sid";

          if(!mysqli_query($link,$query))
          {

          }
          else {
            echo "Deleted Successfully!!";
          }
}
           ?>


         </h2>


      </div>




    <div class="footer" style="margin-top:8.8%;">
    <b> Copyrights 2019 </b>
    </div>

</body>
</html>
