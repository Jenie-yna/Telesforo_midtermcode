<?php
$conn= mysqli_connect("localhost","root", "", "telesforoja");
if(!$conn){
    die ("Connection Failed");
}
$email=$_POST['email'];
$Password=$_POST['Password'];
$sql = "SELECT * From stafftable WHERE email ='$email' And Password='$Password'";
$result = mysqli_query($conn,$sql);
if (mysqli_num_rows($result)>0){
    header("Location: welcome.html");
    exit();
}else{
    echo"LogIn Failed";
}mysql_close($conn);
?>