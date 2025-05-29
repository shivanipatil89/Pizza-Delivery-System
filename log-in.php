<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<?php
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "root", "", "pizza");
if($link === false)
{
	die("ERROR: Could not connect. " . mysqli_connect_error());
}

$uname = $_POST['uname'];
$pass =  $_POST['pass'];

if(isset($uname) && isset($pass))
{
	$sql=" SELECT * From login where uname='".$uname."' and pass='".$pass."'";
	$result = $link->query($sql);
	if($result->num_rows > 0){
		while($row =$result->fetch_assoc()){
			?>
			<script type="text/javascript">
			alert("Welcome Admin.....");
			window.location = "admin/index.html";
			</script>
			
  		 <?php
			
		}
	}
	else
	{
		?>
			<script type="text/javascript">
			alert("Username or Password Not Registered! Contact Your administrator.");
			window.location = "logIn.html";
			</script>
			
  		 <?php
		
	
	}

}
mysqli_close($link);
?>