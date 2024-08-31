<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Order" %>
<%@ page import="service.OrderService" %>

<%
    // Fetch the order list from the database
    OrderService orderService = new OrderService();
    List<Order> orderList = orderService.getAllOrders();
    request.setAttribute("orderList", orderList);
%>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="icon" type="image/x-icon" href="./images/ABC_logo.jpg">
    <title>Payment Method</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .cardStyle {
            width: 250px;
            border-radius: 10px;
        }
        .selectBox {
            width: 20px;
            height: 20px;
            border: 2px solid #fff;
            border-radius: 50%;
        }
        .selectBox.selected {
            background-color: #fff;
        }
    </style>
</head>
<body>
    <div class="bg-light py-4">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
                    <h4>Payment Info</h4>
                    <div class="shadow-sm bg-white p-4 my-4">
                        <h6 class="mb-4">Your Saved Cards</h6>
                        
    
                       <form action="${pageContext.request.contextPath}/processPayment" method="post">
                            <div class="col-sm-6 mt-5">
                                <label for="cardName">Card holder Name</label>
                                <input type="text" id="cardName" name="cardName" class="form-control my-1" required>
                            </div>
                            <div class="col-sm-8 mt-4">
                                <label for="cardNumber">Card Number</label>
                                <input type="text" id="cardNumber" name="cardNumber" class="form-control my-1" required>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 col-xs-6 mt-4">
                                    <label for="expiry">Card Expiry (mm/yy)</label>
                                    <input type="text" id="expiry" name="expiry" class="form-control my-1" required>
                                </div>
                                <div class="col-sm-3 col-xs-6 mt-4">
                                    <label for="cvv">CVV</label>
                                    <input type="text" id="cvv" name="cvv" class="form-control my-1" required>
                                </div>
                            </div>
                            <div class="my-3">
                                <small class="text-secondary">I authorize ABC Restaurant to charge my debit / credit card for the total amount of Rs${sessionScope.totalAmount}</small>
                            </div>
                            <div class="mt-5 mb-3">
                                <div class="row">
                                    <div class="col">
                                        <a href="${pageContext.request.contextPath}/PublicArea/index.jsp" class="btn btn-outline-secondary w-100">Cancel</a>
                                    </div>
                                    <div class="col">
                                      <input type="hidden" name="orderId" value="${sessionScope.orderId}">
                         <button type="submit" class="btn btn-primary w-100">Pay Now</button>
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
                            <h5 class="h6"><strong>Order ID: ${sessionScope.orderId}</strong></h5>
                            <h5 class="h6"><strong>Name: ${sessionScope.customerName}</strong></h5>
                           
                            <table class="w-100 mt-3">
                                <tr>
                                    <td>Total</td>
                                    <td>:</td>
                                    <td><strong class="ms-2 text-success">Rs${sessionScope.totalAmount}</strong></td>
                                </tr>
                                <tr>
                                    <td colspan="3"><hr /></td>
                                </tr>
                            </table>
                            <div>
                                <div class="text-secondary"><span class="badge bg-secondary me-2">ABCREST10</span> Offer applied</div>
                                <div class="text-secondary my-2">Secure payment</div>
                                <div class="text-secondary">30 day money back guarantee</div>
                            </div>
                        </div>
                        <div class="p-4 border-top">
                            <h6><strong>Do you have a promo code? <a href="#">Click here</a></strong></h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            <c:if test="${sessionScope.paymentSuccess}">
                Swal.fire({
                    title: 'Payment Successful!',
                    text: 'Your payment has been processed successfully.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                });
                <% session.removeAttribute("paymentSuccess"); %>
            </c:if>
        });
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
     