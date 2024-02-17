<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Single Page Payment Options</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
       
        body {
            background-color: #000;
        }
        .payment-form {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        .payment-option {
            display: none;
        }
        .payment-option.active {
            display: block;
        }
        .logo {
    width: 100%;
   
    float: left;
    text-align: center;
    background: #000000;
    
    font-size: 75px;
   
}
.logo img{
    
    background-color: #000000;
width: 20%;

}


@media(max-width: 768px){
.logo img{

    width: 50%;
}
    </style>
</head>
<body>


 <div class="logo_section">
            <div class="container">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="logo"><a href="index.jsp"><img src="images/Elect2.png"></a></div>
                  </div>
               </div>
            </div>
         </div>

<div class="container">
    <div class="payment-form">
        <h2 class="text-center mb-4">Checkout</h2>
        <form id="paymentForm" action="/process_payment" method="POST">
            <div class="form-group">
                <label>Select Payment Method:</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="upiOption" value="upi">
                    <label class="form-check-label" for="upiOption">UPI</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="codOption" value="cod">
                    <label class="form-check-label" for="codOption">Cash on Delivery</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="cardOption" value="card">
                    <label class="form-check-label" for="cardOption">Credit/Debit Card</label>
                </div>
            </div>

           
            <div class="payment-option" id="upiPayment">
                
                <p>Instructions for UPI payment</p>
                
                <div class="form-group">
                    <label for="upiId">Enter UPI ID</label>
                    <input type="text" class="form-control" id="upiId" name="upiId" placeholder="Enter UPI ID">
                </div>
            </div>

           
            <div class="payment-option" id="codPayment">
                
                <p>Cash on Delivery instructions</p>
                
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="confirmCOD" name="confirmCOD">
                    <label class="form-check-label" for="confirmCOD">I confirm cash payment upon delivery</label>
                </div>
            </div>

         
            <div class="payment-option" id="cardPayment">
                
                <p>Credit/Debit Card details</p>
                <div class="form-group">
                    <label for="cardNumber">Card Number</label>
                    <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="Enter card number">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="cardHolder">Card Holder Name</label>
                        <input type="text" class="form-control" id="cardHolder" name="cardHolder" placeholder="Enter card holder name">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="expiryDate">Expiry Date</label>
                        <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="MM/YY">
                    </div>
                </div>
                <div class="form-group">
                    <label for="cvv">CVV</label>
                    <input type="text" class="form-control" id="cvv" name="cvv" placeholder="CVV">
                </div>
              
            </div>

            <button type="submit" class="btn btn-primary btn-block mt-3" style="background-color: black;">Proceed to Pay</button>
        </form>
    </div>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // JavaScript to handle showing/hiding payment options based on radio button selection
    $(document).ready(function() {
        $('input[name="paymentMethod"]').change(function() {
            $('.payment-option').removeClass('active');
            var selectedOption = $(this).val();
            $('#' + selectedOption + 'Payment').addClass('active');
        });
    });
</script>
</body>
</html>
    