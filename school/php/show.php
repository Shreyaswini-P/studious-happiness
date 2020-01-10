<?php
include('../config.php');
//$cid=$_GET["cid"];
$q1="SELECT * FROM timetable;";
$r1=mysqli_query($link,$q1);
$resultcheck1=mysqli_num_rows($r1);
$chairs=mysqli_fetch_all($r1,MYSQLI_ASSOC);

foreach ($chairs as $chair) { ?>


    <h1><?php echo "Class: " . htmlspecialchars($chair['cid']);?></h1>

    <td>  <a href="show.php">  <?php echo '<img  src="data:image/jpeg;base64,'.base64_encode( $chair['tt'] ).'"/>';?></a></td>


  </tr>

<?php } ?>
