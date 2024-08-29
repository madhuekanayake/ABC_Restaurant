<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Acceptance</title>
    <link rel="stylesheet" href="./css/payment.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="bg-light py-4">
      <div class="container">
        <div class="row">
          <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
            <h4>Payment Info</h4>
            <div class="shadow-sm bg-white p-4 my-4">
              <h6 class="mb-4">Your Saved Cards</h6>
              <div class="d-flex">
                <div class="shadow cardStyle p-3 bg-black">
                  <div class="d-flex align-items-center justify-content-between">
                    <div class="text-light">VISA</div>
                    <div class="selectBox selected">&#x2713;</div>
                  </div>
                  <div class="my-3">
                    <div><small class="text-secondary">CARD NYUMBER</small></div>
                    <div class="fs-4 text-info">** ** ** 2288</div>
                  </div>
                  <div class="my-3">
                    <div class='d-flex align-items-center justify-content-between'>
                      <div>
                        <div><small class="text-secondary">CARD HOLDER</small></div>
                        <div class="text-white">John Doe P W</div>
                      </div>
                      <div>
                        <div><small class="text-secondary">EXPIRY</small></div>
                        <div class="text-light">02/28</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="ms-4 shadow cardStyle p-3 bg-white">
                  <div class="d-flex align-items-center justify-content-between">
                    <div class="text-secondary">MC</div>
                    <div class="selectBox"></div>
                  </div>
                  <div class="my-3">
                    <div><small class="text-secondary">CARD NYUMBER</small></div>
                    <div class="fs-4 text-dark">** ** ** 8822</div>
                  </div>
                  <div class="my-3">
                    <div class='d-flex align-items-center justify-content-between'>
                      <div>
                        <div><small class="text-secondary">CARD HOLDER</small></div>
                        <div class="text-dark">John Doe P W</div>
                      </div>
                      <div>
                        <div><small class="text-secondary">EXPIRY</small></div>
                        <div class="text-dark">08/22</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
    
              <form action="">
                <div class="col-sm-6 mt-5">
                  <label for="cardName">Name on the card</label>
                  <input type="text" id="cardName" class="form-control my-1">
                </div>
                <div class="col-sm-8 mt-4">
                  <label for="cardNumber">Card Number</label>
                  <input type="text" id="cardNumber" class="form-control my-1">
                </div>
                <div class="row">
                  <div class="col-sm-3 col-xs-6 mt-4">
                    <label for="expiry">Card Expiry (mm/yy)</label>
                    <input type="text" id="expiry" class="form-control my-1">
                  </div>
                  <div class="col-sm-3 col-xs-6 mt-4">
                    <label for="cvv">CVV</label>
                    <input type="text" id="cvv" class="form-control my-1">
                  </div>
                </div>
                <div class="my-3">
                  <small class="text-secondary">I authorize some insurance company to charge my debit / credit card for the total amount of xxx.xx</small>
                </div>
                <div class="mt-5 mb-3">
                  <div class="row">
                    <div class="col">
                      <a href="javascript:goBack()" class="btn btn-outline-secondary w-100">Go Back</a>
                    </div>
                    <div class="col">
                      <button role="button" type="submit" class="btn btn-primary w-100">Charge</button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
            <h4>Purchase Summary</h4>
       
    
            <div class="shadow-sm bg-white p-4 mt-4 mb-3">
            
              <div class="p-4">
                <h5 class="h6"><strong>Price Breakup</strong></h5>
                <table class="w-100 mt-3">
                  <tr>
                    <td>Total</td>
                    <td>:</td>
                    <td><strong class="ms-2 text-success">$11,000</strong></td>
                  </tr>
                  <tr>
                    <td colspan="3"><hr /></td>
                  </tr>
                </table>
                <div>
                  <div class="text-secondary"><span class="badge bg-secondary me-2">big2022</span> Offer applied</div>
                  <div class="text-secondary my-2">Secure payment</div>
                  <div class="text-secondary">30 day money back gaurantee</div>
                </div>
              </div>
              <div class="p-4 border-top">
                <h6><strong>Do you have a code? <a href="#">Click here</a></strong></h6>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>