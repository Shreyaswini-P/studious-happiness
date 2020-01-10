<?php
// Initialize the session
session_start();

// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
?>



<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/styles.css">
  <style media="screen">
  body
  {
    background-image:url('./1.png');

  }

  </style>
</head>
<body>

<div class="header" style="background-color: rgba(66, 191, 245);opacity:0.9;color:white;" >
  <h1 >Welcome <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b></h1>
  <div class="header-right">
    <a class="active" href="logout.php">Sign Out</a>

  </div>
</div>
  <hr style="height:2px;">
<div style="overflow:auto">
  <div class="menu" style="background-color: rgba(66, 191, 245);opacity:0.9">
    <a class="active" href="#">Home</a>
    <a href="./php/class.php">Class</a>
    <a href="./php/teacher.php">Teacher</a>
    <a href="./php/student.php">Student</a>
    <a href="./php/parent.php">Parent</a>
    <a href="./php/subject.php">Subject</a>
    <a href="./php/tt.php">Time Table</a>
  </div>

<div style="overflow:auto">
  <div class="main">

        <div class="count">
          <h1>No of Classes: <span> <?php include('./php/nclass.php') ?></span>  </h1>
          <h1>No of Teachers: <span> <?php include('./php/nteach.php') ?></span>  </h1>
          <h1>No of Students: <span> <?php include('./php/nstu.php') ?></span>  </h1>
        </div>

  </div>
</div>

</div>

<div class="footer" style="background-color: rgba(66, 191, 245);opacity:0.8">© copyright 2019</div>

</body>
</html>
