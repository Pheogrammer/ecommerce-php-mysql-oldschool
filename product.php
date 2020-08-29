<?php include 'includes/session.php'; ?>
<?php
	$conn = $pdo->open();


	$slug = $_GET['product'];




	try{
		 		
	    $stmt = $conn->prepare("SELECT *, products.name AS prodname, category.name AS catname, products.id AS prodid FROM products LEFT JOIN category ON category.id=products.category_id WHERE slug = :slug");
	    $stmt->execute(['slug' => $slug]);
	    $product = $stmt->fetch();
		
	}
	catch(PDOException $e){
		echo "There is some problem in connection: " . $e->getMessage();
	}
	

	//page view
	$now = date('Y-m-d');
	if($product['date_view'] == $now){
		$stmt = $conn->prepare("UPDATE products SET counter=counter+1 WHERE id=:id");
		$stmt->execute(['id'=>$product['prodid']]);
	}
	else{
		$stmt = $conn->prepare("UPDATE products SET counter=1, date_view=:now WHERE id=:id");
		$stmt->execute(['id'=>$product['prodid'], 'now'=>$now]);
	}

	// 
		
if(isset($_POST['submit'])){
	if($_POST['comment']!=''){
		$rate = htmlspecialchars($_POST['rate']);
		$comment = htmlspecialchars($_POST['comment']);
		
		$stmt = $conn->prepare("INSERT INTO comments (product, user, comment, rate, date) VALUES (:product, :user, :comment, :rate, :date)");
		$stmt->execute(['product'=>$product['id'], 'user'=>$user['id'], 'comment'=>$comment, 'rate'=>$rate, 'date'=>$now]);
		$_SESSION['success'] = 'Rate & Comment submited successfully!.';
	}
}
	// 

?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue layout-top-nav">

<div class="wrapper">

	<?php include 'includes/navbar.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
	        	<div class="col-sm-9">
	        		<div class="callout" id="callout" style="display:none">
	        			<button type="button" class="close"><span aria-hidden="true">&times;</span></button>
	        			<span class="message"></span>
	        		</div>
					<div class="row">
						<div class="col">
						<?php

	        			if(isset($_SESSION['success'])){
	        				echo "
	        					<div class='callout callout-success'>
	        						".$_SESSION['success']."
	        					</div>
	        				";
	        				unset($_SESSION['success']);
	        			}
	        		?>
						</div>
					</div>
		            <div class="row">
		            	<div class="col-sm-6">
		            		<img src="<?php echo (!empty($product['photo'])) ? 'images/'.$product['photo'] : 'images/noimage.jpg'; ?>" width="100%" class="zoom" data-magnify-src="images/large-<?php echo $product['photo']; ?>">
		            		<br><br>
		            		<form class="form-inline" id="productForm">
		            			<div class="form-group">
			            			<div class="input-group col-sm-5">
			            				
			            				<span class="input-group-btn">
			            					<button type="button" id="minus" class="btn btn-default btn-flat btn-lg"><i class="fa fa-minus"></i></button>
			            				</span>
							          	<input type="text" name="quantity" id="quantity" class="form-control input-lg" value="1">
							            <span class="input-group-btn">
							                <button type="button" id="add" class="btn btn-default btn-flat btn-lg"><i class="fa fa-plus"></i>
							                </button>
							            </span>
							            <input type="hidden" value="<?php echo $product['prodid']; ?>" name="id">
							        </div>
			            			<button type="submit" class="btn btn-primary btn-lg btn-flat"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
			            		</div>
		            		</form>
		            	</div>
		            	<div class="col-sm-6">
		            		<h1 class="page-header"><?php echo $product['prodname']; ?></h1>
		            		<h3><b>Tshs <?php echo number_format($product['price'], 2); ?></b></h3>
		            		<p><b>Category:</b> <a href="category.php?category=<?php echo $product['cat_slug']; ?>"><?php echo $product['catname']; ?></a></p>
		            		<p><b>Description:</b></p>
		            		<p><?php echo $product['description']; ?></p>
							<?php $dsr = $product['cat_slug']; ?>
							<p>Rate : <i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i></p>
		            	</div>
		            </div>
		            <br>
				    <div class="" width="100%">
					<button type="button" class="btn btn-success" data-toggle="modal" data-target=".bd-example-modal-lg">  <i class="fa fa-star-o" aria-hidden="true"></i> <i class="fa fa-star-half-o" aria-hidden="true"></i> <i class="fa fa-commenting-o" aria-hidden="true"></i> View Reviews and Comments</button>

					<h4>Rate & Your Review</h4>
					
					<form action="" method="post"> 
					<input class="form-check-input" type="radio" name="rate" id="" value="0"> <i class="fa fa-star-o    "></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i> 0 star<br>

					<input class="form-check-input" type="radio" name="rate" id="" value="1"> <i class="fa fa-star    "></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i> 1 star<br>
					<input class="form-check-input" type="radio" name="rate" id="" value="2">	<i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i> 2 stars<br>
					<input class="form-check-input" type="radio" name="rate" id="" value="3">	<i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i> 3 stars<br>
					<input class="form-check-input" type="radio" name="rate" id="" value="4">	<i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star-o" aria-hidden="true"></i> 4 stars<br>
					<input class="form-check-input" checked type="radio" name="rate" id="" value="5">	<i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i> 5 stars<br>
						
						<br><div class="form-group">
						  <label for="">Comment</label>
						  <textarea <?php if(isset($_SESSION['user'])){  } else{ echo 'disabled'; }?> required type="text" name="comment" id="" class="form-control" placeholder="" aria-describedby="helpId"></textarea>
						  <small id="helpId" class="text-muted">Anything you write here will be seen by everyone</small>
						</div>
						
						<button <?php if(isset($_SESSION['user'])){  } else{ echo 'disabled'; }?> type="submit" name="submit" class="btn btn-primary">Submit</button>
						
					</form>
					<?php if(isset($_SESSION['user'])){  } else{ ?> 				<small><b style="color: red;">Login first to able to rate & comment</b></small>		
 <?php }?>
				
						<br><br>
						<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	<div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Recent Reviews & Comments for this product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color: red;">X</span>
        </button>
      </div>
	  <?php 
	  $conn = $pdo->open();

	  try{
		   $inc = 3;	
	   $stmt = $conn->prepare("SELECT * FROM comments");
	   $stmt->execute();
	   foreach ($stmt as $row1) {
			 $userd = $conn->  prepare("SELECT * FROM users WHERE `id` = :user_id");
			 $userd->execute(['user_id'=>$row1['user']]);
			 foreach ($userd as $row2) {
				$itemd = $conn->  prepare("SELECT * FROM users WHERE `id` = :id");
				$itemd->execute(['id'=>$row1['product']]);
				foreach ($itemd as $row3) {
		   ?>

		<div class="modal-body" style="padding-left: 40px; border-bottom:1px solid #000;" >

		<p>
		Comment : <?php echo  $row1['comment']; ?>.
		</p>
		Rate :  <?php if($row1['rate']=='0'){
echo '<i class="fa fa-star-o    "></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><br>
';
		}else
		 if($row1['rate']=='1'){ echo '<i class="fa fa-star    "></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><br>
			'; }else 
		if($row1['rate']=='2'){ echo '<i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><br>
				';} else 
		if($row1['rate']=='3'){ echo '<i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i> <br>
					';}else
		 if($row1['rate']=='4'){ echo '<i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star-o" aria-hidden="true"></i> <br>
						';}else
		 if($row1['rate']=='5'){ echo '<i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><i class="fa fa-star    "></i><br>
							';}?>

	

		<br>
		<i class="fa fa-user" aria-hidden="true"></i> <?php echo  $row2['firstname'].' '.$row2['lastname']; ?>, <i class="fa fa-calendar" aria-hidden="true"></i> <?php  echo  $row1['date']; ?>


		</div>
		
	   <?php }}}}
   catch(PDOException $e){
	   echo "There is some problem in connection: " . $e->getMessage();
   }

   $pdo->close();

	  ?>
	  <!--  -->
     
	  <!--  -->
	  <?php ?>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
					</div> 
	        	</div>
	        	<div class="col-sm-3">
	        		<?php include 'includes/sidebar.php'; ?>
	        	</div>
	        </div>
	      </section>
		  <section class="content">
		  <?php 
		  
		  $resp = $conn->prepare("SELECT * FROM category WHERE cat_slug = :slug"); 
		  $resp->execute(['slug' => $dsr]);
		  foreach($resp as $categd)
		  {?>
				      <div class="row">
	        	<div class="col">
		            <h1 class="page-header"> Other Products from Category: <?php echo $categd['name']; ?></h1>
		       		<?php
		       			

		       			try{
		       			 	$inc = 4;	
						    $stmt = $conn->prepare("SELECT * FROM products WHERE category_id = :catid LIMIT 4");
						    $stmt->execute(['catid' => $categd['id']]);
						    foreach ($stmt as $row) {
						    	$image = (!empty($row['photo'])) ? 'images/'.$row['photo'] : 'images/noimage.jpg';
						    	$inc = ($inc == 3) ? 1 : $inc + 1;
	       						if($inc == 1) echo "<div class='row'>";
	       						echo "
	       							<div class='col-sm-3'>
	       								<div class='box box-solid'>
		       								<div class='box-body prod-body'>
		       									<img src='".$image."' width='100%' height='230px' class='thumbnail'>
		       									<h5><a href='product.php?product=".$row['slug']."'>".$row['name']."</a></h5>
		       								</div>
		       								<div class='box-footer'>
		       									<b>Tshs ".number_format($row['price'], 2)."</b>
		       								</div>
	       								</div>
	       							</div>
	       						";
	       						if($inc == 4) echo "</div>";
						    }
						    if($inc == 1) echo "<div class='col-sm-3'></div><div class='col-sm-3'></div></div>"; 
							if($inc == 2) echo "<div class='col-sm-3'></div></div>";
						}
						catch(PDOException $e){
							echo "There is some problem in connection: " . $e->getMessage();
						}

						$pdo->close();

		       		?> 
	        	</div>
	        </div>
		  <?php 
		  }
		  ?>
	  
	      </section>
	    </div>
	  </div>
  	<?php $pdo->close(); ?>
  	<?php include 'includes/footer.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
	$('#add').click(function(e){
		e.preventDefault();
		var quantity = $('#quantity').val();
		quantity++;
		$('#quantity').val(quantity);
	});
	$('#minus').click(function(e){
		e.preventDefault();
		var quantity = $('#quantity').val();
		if(quantity > 1){
			quantity--;
		}
		$('#quantity').val(quantity);
	});

});
</script>
</body>
</html>