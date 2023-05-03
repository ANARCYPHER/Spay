<?php require PATH . '/theme/view/common/header.php';?>
<?php 
include ('../app/config/db.config.php');

$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$username = $AuthUser['username'];
$today = date("Y-m-d");
$premiumexpire = $AuthUser['date'];
$newpremium = date('Y-m-d', strtotime('+1200 month', strtotime($today)));;
$plusmonth = date('Y-m-d', strtotime('+1200 month', $premiumexpire));

 if (strtotime($today) > strtotime($premiumexpire)) {
    $sql = "UPDATE users SET date = '$newpremium' WHERE username='$username'";
    $sql1 = "UPDATE users SET account_type = 'premium' WHERE username='$username'";
 }else{
	$sql = "UPDATE users SET date = DATE_ADD(date, INTERVAL 12 month ) WHERE username='$username'";
    $sql1 = "UPDATE users SET account_type = 'premium' WHERE username='$username'";
}

if ($conn->query($sql) === TRUE) {
  echo "<meta http-equiv='refresh' content='0;url=" . APP . "/?success' />";
} else {
  echo "";
}
if ($conn->query($sql1) === TRUE) {
  echo "";
} else {
  echo "";
}
?>

<?php require PATH . '/theme/view/common/footer.php';?>
