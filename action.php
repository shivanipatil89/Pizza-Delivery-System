<link rel="stylesheet" href="mystyle.css">
<?php
	session_start();
	require 'config.php';

	// Add products into the cart table
	if (isset($_POST['pid'])) {
	  $pid = $_POST['pid'];
	  $pname = $_POST['pname'];
	  $pprice = $_POST['pprice'];
	  $pimg = $_POST['pimg'];
	  $pingre = $_POST['pingre'];
      $co_qty=$_POST['co_qty'];
	  $total_price = $pprice * $co_qty;

	  $stmt = $conn->prepare('SELECT pid FROM cart WHERE pid=?');
	  $stmt->bind_param('i',$pid);
	  $stmt->execute();
	  $res = $stmt->get_result();
	  $r = $res->fetch_assoc();
	  $code = $r['pid'] ?? '';

	  if (!$code) {
	    $query = $conn->prepare('INSERT INTO cart (pid,pname,pimg,pingre,pprice,co_qty,total_price) VALUES (?,?,?,?,?,?,?)');
	    $query->bind_param('isssiii',$pid,$pname,$pimg,$pingre,$pprice,$co_qty,$total_price);
	    $query->execute();

	    echo '<div class="alert alert-success alert-dismissible mt-2">
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
						  <strong>Item added to your cart!</strong>
						</div>';
	  } else {
	    echo '<div class="alert alert-danger alert-dismissible mt-2">
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
						  <strong>Item already added to your cart!</strong>
						</div>';
	  }
	}

	// Get no.of items available in the cart table
	if (isset($_GET['cartItem']) && isset($_GET['cartItem']) == 'cart_item') {
	  $stmt = $conn->prepare('SELECT * FROM cart');
	  $stmt->execute();
	  $stmt->store_result();
	  $rows = $stmt->num_rows;

	  echo $rows;
	}

	// Remove single items from cart
	if (isset($_GET['remove'])) {
	  $coid = $_GET['remove'];

	  $stmt = $conn->prepare('DELETE FROM cart WHERE pid=?');
	  $stmt->bind_param('i',$pid);
	  $stmt->execute();

	  $_SESSION['showAlert'] = 'block';
	  $_SESSION['message'] = 'Item removed from the cart!';
	  header('location:cart.php');
	}

	// Remove all items at once from cart
	if (isset($_GET['clear'])) {
	  $stmt = $conn->prepare('DELETE FROM cart');
	  $stmt->execute();
	  $_SESSION['showAlert'] = 'block';
	  $_SESSION['message'] = 'All Item removed from the cart!';
	  header('location:cart.php');
	}

	// Set total price of the product in the cart table
	if (isset($_POST['co_qty'])) {
	  $co_qty = $_POST['co_qty'];
	  $pid = $_POST['pid'];
	  $pprice = $_POST['pprice'];

	  $pprice = $co_qty * $pprice;

	  $stmt = $conn->prepare('UPDATE cart SET co_qty=?, total_price=? WHERE pid=?');
	  $stmt->bind_param('iii',$co_qty,$total_price,$pid);
	  $stmt->execute();
	}

	// Checkout and save customer info in the orders table
	if (isset($_POST['action']) && isset($_POST['action']) == 'order') {
	  $custo_name = $_POST['custo_name'];
	  $custo_mail = $_POST['custo_mail'];
	  $custo_phone = $_POST['custo_phone'];
	  $del_add = $_POST['del_add'];
	  $t_order = $_POST['t_order'];
	  $d_date = $_POST['d_date'];
	  $d_time = $_POST['d_time'];
	  $grand_total = $_POST['grand_total'];
	  $products = $_POST['products'];
	 
	  $data = '';

	  $sql = "INSERT INTO orders (custo_name,custo_mail,custo_phone,del_add,t_order,d_date,d_time,products,amount_paid)VALUES('$custo_name','$custo_mail','$custo_phone','$del_add','$t_order','$d_date','$d_time','$products','$grand_total')";
	$stmt = $conn->prepare($sql);
	$stmt->execute();


	 
	  $stmt2 = $conn->prepare('DELETE FROM cart');
	  $stmt2->execute();
	  $data .= '<div class="text-center">
								<h2 class="text-success">Your Order Placed Successfully!</h2>
								<h4 class="bg-danger text-light rounded p-2">Items Purchased : ' . $products. '</h4>
								<h4>Your Name : ' . $custo_name . '</h4>
								<h4>Your E-mail : ' . $custo_mail . '</h4>
								<h4>Your Phone : ' . $custo_phone . '</h4>
								<h4>Total Amount Pay : ' . number_format($grand_total,2) . '</h4>
						  </div>';
	  echo $data;
	$to =' '.$custo_mail;
	$subject='Your Order Placed Successfully!';
	$message=' '.$data;

	}
?>