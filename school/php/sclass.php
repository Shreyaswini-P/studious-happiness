<?php
include('../config.php');
$q1="SELECT * FROM class;";
$r1=mysqli_query($link,$q1);
$resultcheck1=mysqli_num_rows($r1);
$chairs=mysqli_fetch_all($r1,MYSQLI_ASSOC);



 ?>






  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>Show Classes</title>
      <link rel="stylesheet" href="../css/sstyles.css">
  </head>

  <body>
    <div class="header">
      <h1 >Classes</h1>
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
        <td>Class ID</td>
        <td>Class</td>
        <td>Section</td>
      </tr>

        <?php
      foreach ($chairs as $chair) { ?>

        <tr >
          <td><?php echo htmlspecialchars($chair['cid']);?></td>
          <td><?php echo htmlspecialchars($chair['class']);?></td>
          <td><?php echo htmlspecialchars($chair['sec']);?></td>
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
