<div class="footer" style="color: #fff;">
		<div class="container">
			<div class="w3_footer_grids">
				<div class="col-md-3 w3_footer_grid">
					<h3>Contact</h3>
					<p>KJNF ONLINE SHOP.</p>
					<ul class="address">
						<li style="list-style: none;"><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i> Kijitonyama, 4th block, <span>Dar es salaam.</span></li>
						<li style="list-style: none;"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i> <a href="mailto:info@example.com">info@kjnf.com</a></li>
						<li style="list-style: none;"><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i> +1234 567 567</li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Information</h3>
					<ul class="info"> 
						<li style="list-style: none;"><a href="about.php">About Us</a></li>
						<li style="list-style: none;"><a href="mail.php">Contact Us</a></li>
						</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Categories</h3>
					
					<div class="row">
					<?php
             
                $conn = $pdo->open();
                try{
                  $stmt = $conn->prepare("SELECT * FROM category");
                  $stmt->execute();
                  foreach($stmt as $row){
                    echo "
                    <div class='col-md-6'>
						  <li style='list-style: none;'><a href='category.php?category=".$row['cat_slug']."'>".$row['name']."</a></li>
						  
						  </div>";                  
                  }
                }
                catch(PDOException $e){
                  echo "There is some problem in connection: " . $e->getMessage();
                }

                $pdo->close();

              ?>
						
						
					</div>
					
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Follow Us</h3>
					<ul>
							<li style="list-style: none;"><a href="#" class="facebook"> <i class="fa fa-facebook-official" aria-hidden="true"></i> </a> </li>
							<li style="list-style: none;"><a href="#" class="twitter"> <i class="fa fa-twitter-square" aria-hidden="true"></i> </a></li>
							<li style="list-style: none;"><a href="#" class="google"> <i class="fa fa-google-plus-square" aria-hidden="true"></i> </a></li>
							<li style="list-style: none;"><a href="#" class="pinterest"> <i class="fa fa-pinterest-square" aria-hidden="true"></i> </a></li>
						</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<hr>
		<div class="footer-copy">
			
			<div class="container">
      <div class="pull-right hidden-xs">
        <b>All rights reserved</b>
      </div>
      <strong>Copyright &copy; <?php echo date('Y'); ?> KJNF</strong>
    </div>
		</div>
	</div>