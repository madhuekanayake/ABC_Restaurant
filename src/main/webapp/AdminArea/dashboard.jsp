<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Order" %>
<%@ page import="service.OrderService" %>

<%
    OrderService orderService = new OrderService();
    List<Order> allOrders = orderService.getAllOrders();
    List<Order> paidOrders = orderService.getPaidOrders();
    List<Order> unpaidOrders = orderService.getUnpaidOrders();
    double totalPaidAmount = orderService.getTotalPaidAmount();
    request.setAttribute("allOrders", allOrders);
    request.setAttribute("paidOrders", paidOrders);
    request.setAttribute("unpaidOrders", unpaidOrders);
    request.setAttribute("totalPaidAmount", totalPaidAmount);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./images/ABC_logo.jpg">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/style.css">
    <title>ABC Restaurant</title>
    <style>
        .status-paid {
            color: green;
            font-weight: bold;
        }
        .status-unpaid {
            color: red;
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
                    <h1>Dashboard</h1>
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">Dashboard</a>
                        </li>
                        <li><i class='bx bx-chevron-right' ></i></li>
                        <li>
                            <a class="active" href="#">Home</a>
                        </li>
                    </ul>
                </div>
            </div>
            <ul class="box-info">
                <li>
                    <i class='bx bxs-calendar-check' ></i>
                    <span class="text">
                        <h3>102</h3>
                        <p>New Orders</p>
                    </span>
                </li>
                <li>
                    <i class='bx bxs-group' ></i>
                    <span class="text">
                        <h3>2834</h3>
                        <p>Customers</p>
                    </span>
                </li>
                <li>
                    <i class='bx bxs-dollar-circle' ></i>
                    <span class="text">
                        <h3>${totalPaidAmount}</h3>
                        <p>Total Sales</p>
                    </span>
                </li>
            </ul>
            

            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>Paid Orders</h3>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer Name</th>
                                <th>Email</th>
                                <th>Total Amount</th>
                                <th>Order Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${paidOrders}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${order.firstName} ${order.lastName}</td>
                                    <td>${order.email}</td>
                                    <td>Rs${order.totalAmount}</td>
                                    <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                </div>
            </div>

            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>Unpaid Orders</h3>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer Name</th>
                                <th>Email</th>
                                <th>Total Amount</th>
                                <th>Order Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${unpaidOrders}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${order.firstName} ${order.lastName}</td>
                                    <td>${order.email}</td>
                                    <td>Rs${order.totalAmount}</td>
                                    <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </section>
    <script src="./js/script.js"></script>
</body>
</html>