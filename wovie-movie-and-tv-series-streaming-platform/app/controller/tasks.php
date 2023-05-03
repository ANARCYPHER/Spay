<?php 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include ('../../../app/config/db.config.php');

$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

$sql = "UPDATE users SET account_type = 'user' WHERE date < NOW();";

if ($conn->query($sql) === TRUE) {
  echo "";
} else {
  echo "";
}
?>
