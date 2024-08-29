<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Method</title>
    <link rel="stylesheet" href="./css/payment.css">
    
    <style>
    
    body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    text-align: center;
    background-color: #ffffff;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 400px;
}

.logo {
    width: 180px;
    margin-bottom: 20px;
}

.main-heading {
    font-size: 18px;
    color: #003366;
    margin-bottom: 30px;
}

.payment-options {
    display: flex;
    justify-content: space-evenly;
    margin-bottom: 20px;
}

.payment-button {
    background-color: #ffffff;
    border: 2px solid transparent;
    border-radius: 8px;
    padding: 10px;
    width: 30%;
    text-align: center;
    cursor: pointer;
    text-decoration: none;
    transition: border-color 0.3s ease;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.payment-button img {
    width: 40px;
    height: auto;
    display: block;
    margin-bottom: 10px;
}

.payment-button span {
    font-size: 14px;
    font-weight: bold;
    color: #333;
}

.payment-button:hover,
.payment-button:focus {
    border-color: #4CAF50; /* Green border on hover */
}

.pay-button {
    background-color: #0047ab;
    color: #ffffff;
    border: none;
    padding: 12px 24px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 20px;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

.pay-button:hover {
    background-color: #003366;
}

.card-icon {
    margin-left: 10px;
}
    
    </style>
</head>


<body>
    <div class="container">
        <header>
            <img src="https://yourlogo.com/logo.png" alt="ABC Restaurant" class="logo">
        </header>
        <h2 class="main-heading">SELECT YOUR PAYMENT METHOD</h2>
        <div class="payment-options">
            <a href="./paymentProcess.jsp" class="payment-button visa">
                <img src="https://upload.wikimedia.org/wikipedia/commons/5/5e/Visa_Inc._logo.svg" alt="Visa">
                <span>Visa</span>
            </a>
            <a href="./paymentProcess.jsp" class="payment-button mastercard">
                <img src="https://upload.wikimedia.org/wikipedia/commons/a/a4/Mastercard_2019_logo.svg" alt="MasterCard">
                <span>MasterCard</span>
            </a>
            
        </div>
        
    </div>
</body>
</html>