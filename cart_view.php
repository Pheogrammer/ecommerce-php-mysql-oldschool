<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<?php
if(isset($_POST['submit'])){
	if($_POST['coded']!=''){
		$datasd = strtoupper(htmlspecialchars($_POST['coded']));
		header('location: sales.php?pay='.$datasd.'');
	}
}
?>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

	<?php include 'includes/navbar.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
	        	<div class="col-sm-9">
	        		<h1 class="page-header">YOUR CART</h1>
	        		<div class="box box-solid">
	        			<div class="box-body">
		        		<table class="table table-bordered">
		        			<thead>
		        				<th></th>
		        				<th>Photo</th>
		        				<th>Name</th>
		        				<th>Price</th>
		        				<th width="20%">Quantity</th>
		        				<th>Subtotal</th>
		        			</thead>
		        			<tbody id="tbody">
		        			</tbody>
		        		</table>
	        			</div>
	        		</div>
	        		<?php
	        			if(isset($_SESSION['user'])){
	        				echo '
								<div id="paypal-button"></div>
								<button type="button" class="btn btn-success" style="border-radius:50px;" data-toggle="modal" data-target=".bd-example-modal-lg"> <i class="fa fa-phone"></i> Mobile Payment</button>
								<a href="sales.php?pay="></a>
	        				';
	        			}
	        			else{
	        				echo "
	        					<h4>You need to <a href='login.php'>Login</a> to checkout.</h4>
	        				";
	        			}
	        		?>
	        	</div>
	        	<div class="col-sm-3">
	        		<?php include 'includes/sidebar.php'; ?>
	        	</div>
	        </div>
	      </section>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
	<div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Payments Through Mobile Money</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="text-danger">Close</span>
        </button>
      </div>
	  <form action="#" enctype="multipart/form-data" method="post">
      <div class="modal-body">
	  <h4>Accepted Mobile Payments</h4>
	  <div class="row">

		  <div class="col">
		 &nbsp; <img style="border-radius: 10px;" src="ads/airtel.png" alt="Mpesa" height="40px">
		  <img style="border-radius: 10px;" src="ads/mpesa.jpeg" alt="Mpesa" height="40px">
		  <img src="ads/tigopesa.png" alt="Mpesa" height="40px">


		  </div>
	  </div>
	  <br>
	  <div class="row" style="padding-left: 50px;">

		  <div class="col">
		  <p>
		  Through your mobile money menu <br>
		  <b>*150*00#</b> for Vodacom, <b>*150*01#</b> for Tigo, <b>*150*60#</b> for Airtel <br>
		  <br>
		  <br>
		  Choose Pay by Mpesa, Tigopesa, AirtelMoney <br>
		  Choose  <b>enter business number</b> <br>
		  Enter number <b>122343</b>  <br>
		  Enter reference number <b>random</b>
		  Enter amount to pay <br> (Any Amount Exceeded the payment for cart will be added in your Account's Wallet ) <br>

		  <br>
		  </p>
		  </div>
	  </div>

	  <p>
	  After Payment Completed, Enter Your Transaction number below <br> You can use transaction number only once</p>

	  <div class="form-group">
		  <label for="my-input">Transaction Reference Number</label>
		  <input id="my-input" value="" required class="form-control" type="text" minlength="16" maxlength="16" name="coded">
	  </div>
	  	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <button type="submit" name="submit" class="btn btn-primary">Submit</button>
      </div>
	  </form>
    </div>
  </div>
</div>
	     
	    </div>
	  </div>
  	<?php $pdo->close(); ?>
  	<?php include 'includes/footer.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>
<script>
var total = 0;
$(function(){
	$(document).on('click', '.cart_delete', function(e){
		e.preventDefault();
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: 'cart_delete.php',
			data: {id:id},
			dataType: 'json',
			success: function(response){
				if(!response.error){
					getDetails();
					getCart();
					getTotal();
				}
			}
		});
	});

	$(document).on('click', '.minus', function(e){
		e.preventDefault();
		var id = $(this).data('id');
		var qty = $('#qty_'+id).val();
		if(qty>1){
			qty--;
		}
		$('#qty_'+id).val(qty);
		$.ajax({
			type: 'POST',
			url: 'cart_update.php',
			data: {
				id: id,
				qty: qty,
			},
			dataType: 'json',
			success: function(response){
				if(!response.error){
					getDetails();
					getCart();
					getTotal();
				}
			}
		});
	});

	$(document).on('click', '.add', function(e){
		e.preventDefault();
		var id = $(this).data('id');
		var qty = $('#qty_'+id).val();
		qty++;
		$('#qty_'+id).val(qty);
		$.ajax({
			type: 'POST',
			url: 'cart_update.php',
			data: {
				id: id,
				qty: qty,
			},
			dataType: 'json',
			success: function(response){
				if(!response.error){
					getDetails();
					getCart();
					getTotal();
				}
			}
		});
	});

	getDetails();
	getTotal();

});

function getDetails(){
	$.ajax({
		type: 'POST',
		url: 'cart_details.php',
		dataType: 'json',
		success: function(response){
			$('#tbody').html(response);
			getCart();
		}
	});
}

function getTotal(){
	$.ajax({
		type: 'POST',
		url: 'cart_total.php',
		dataType: 'json',
		success:function(response){
			total = response;
		}
	});
}
</script>
<!-- Paypal Express -->
<script>
paypal.Button.render({
    env: 'sandbox', // change for production if app is live,

	client: {
        sandbox:    'ASb1ZbVxG5ZFzCWLdYLi_d1-k5rmSjvBZhxP2etCxBKXaJHxPba13JJD_D3dTNriRbAv3Kp_72cgDvaZ',
        //production: 'AaBHKJFEej4V6yaArjzSx9cuf-UYesQYKqynQVCdBlKuZKawDDzFyuQdidPOBSGEhWaNQnnvfzuFB9SM'
    },

    commit: true, // Show a 'Pay Now' button

    style: {
    	color: 'gold',
    	size: 'small'
    },

    payment: function(data, actions) {
        return actions.payment.create({
            payment: {
                transactions: [
                    {
                    	//total purchase
                        amount: { 
                        	total: total, 
                        	currency: 'USD' 
                        }
                    }
                ]
            }
        });
    },

    onAuthorize: function(data, actions) {
        return actions.payment.execute().then(function(payment) {
			window.location = 'sales.php?pay='+payment.id;
        });
    },

}, '#paypal-button');
</script>
</body>
</html>