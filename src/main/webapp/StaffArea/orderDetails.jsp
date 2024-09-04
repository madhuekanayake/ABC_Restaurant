<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Order" %>
<%@ page import="service.OrderService" %>

<%
    OrderService orderService = new OrderService();
    List<Order> orderList = orderService.getAllOrders();
    request.setAttribute("orderList", orderList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./image/ABC_logo.jpg">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/style.css">
    <title>Order Details - ABC Restaurant</title>
    <style>
        .order-details {
            background-color: #f9f9f9;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .order-items {
            margin-top: 20px;
        }
        .status-paid {
            color: green;
            font-weight: bold;
        }
        .status-unpaid {
            color: red;
            font-weight: bold;
        }
        .status-confirmed {
            color: blue;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <jsp:include page="./sideBar.jsp" />
    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Order Details</h1>
                    <ul class="breadcrumb">
                        <li><a href="#">Customer Orders</a></li>
                        <li><i class='bx bx-chevron-right' ></i></li>
                        <li><a class="active" href="#">Order Details</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="order-details">
                <h2>Order #${order.id}</h2>
                <p><strong>Customer Name:</strong> ${order.firstName} ${order.lastName}</p>
                <p><strong>Email:</strong> ${order.email}</p>
                <p><strong>Phone:</strong> ${order.phone}</p>
                <p><strong>Address:</strong> ${order.address}, ${order.city}, ${order.postalCode}</p>
                <p><strong>Order Date:</strong> <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                <p><strong>Total Amount:</strong> Rs${order.totalAmount}</p>
                <p><strong>Payment Status:</strong> 
                    <c:choose>
                        <c:when test="${order.status == 1}">
                            <span class="status-paid">Paid</span>
                        </c:when>
                        <c:otherwise>
                            <span class="status-unpaid">Unpaid</span>
                        </c:otherwise>
                    </c:choose>
                </p>
                <p><strong>Order Confirmation:</strong> 
                    <c:choose>
                        <c:when test="${order.orderConfirmation == 1}">
                            <span class="status-confirmed">Confirmed</span>
                        </c:when>
                        <c:otherwise>
                            Not Confirmed
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
            
            <div class="order-items">
                <h3>Order Items</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${order.orderItems}">
                            <tr>
                                <td>${item.productName}</td>
                                <td>${item.quantity}</td>
                                <td>Rs${item.price}</td>
                                <td>Rs${item.quantity * item.price}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3"><strong>Total</strong></td>
                            <td><strong>Rs${order.totalAmount}</strong></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </main>
    </section>
    <script src="./js/script.js"></script>
</body>
</html>