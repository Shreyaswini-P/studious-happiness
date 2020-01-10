<?php
include('../config.php');
$q1="SELECT * FROM teacher;";
$r1=mysqli_query($link,$q1);
$resultcheck1=mysqli_num_rows($r1);
$chairs=mysqli_fetch_all($r1,MYSQLI_ASSOC);

 ?>






  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>Show Teachers</title>
      <link rel="stylesheet" href="../css/sstyles.css">
  </head>

  <body>
    <div class="header">
      <h1 >Teachers</h1>
      <div class="header-right">
        <a class="active" href="./php/logout.php">Sign Out</a>
      </div>
    </div>

      <div style="overflow:auto;">
        <div class="menu">

            <a href="../index.php" class="active">Home</a>



        </div>

      </div>


  <div class="main">
    <div class="forms" style="width:60vw;height:25vw;margin-top:5vw;border: none;;overflow-y:scroll;margin-left:20%;">
    <form >
      <table >
      <tr id="first">
        <td>Teacher ID</td>
        <td>Name</td>
        <td>Subject</td>
        <td>Phone</td>
        <td>Class</td>

      </tr>

        <?php
      foreach ($chairs as $chair) { ?>

        <tr >
          <td><?php echo htmlspecialchars($chair['tid']);?></td>
          <td><?php echo htmlspecialchars($chair['name']);?></td>
          <td><?php echo htmlspecialchars($chair['sub']);?></td>
          <td><?php echo htmlspecialchars($chair['phone']);?></td>
          <td><?php echo htmlspecialchars($chair['class']);?></td>

        </tr>

      <?php } ?>


    </table>

    </form>
      </div>
  </div>




      <div class="footer" style="margin-top:3.8%">
      <b> Copyrights 2019 </b>
      </div>


  </body>
  </html>
