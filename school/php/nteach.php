<?php





$q1="SELECT count(*) as total FROM teacher;";
$r1=mysqli_query($link,$q1);
$resultcheck1=mysqli_num_rows($r1);
if ($resultcheck1>0) {

  while($row1 = mysqli_fetch_assoc($r1)){
  echo  $row1['total'] . "<br>";
}
}
 ?>
