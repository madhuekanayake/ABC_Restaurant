<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/style.css">
    <title>ABC Restaurant</title>
    <style>
        /* Updated Table Styling */
        .order-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        .order-table th, .order-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            transition: all 0.3s ease;
        }
        .order-table th {
            background-color: #f4f4f4;
            font-weight: 600;
            color: #333;
        }
        .order-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .order-table tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }
        .order-table td {
            color: #555;
        }
        .status-paid {
            color: #28a745;
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 4px;
            background-color: #e6f7ea;
        }
        .status-unpaid {
            color: #dc3545;
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 4px;
            background-color: #f8d7da;
        }
        .order-table td:first-child, 
        .order-table th:first-child {
            border-top-left-radius: 8px;
            border-bottom-left-radius: 8px;
        }
        .order-table td:last-child, 
        .order-table th:last-child {
            border-top-right-radius: 8px;
            border-bottom-right-radius: 8px;
        }
    </style>
</head>
<body>
    <jsp:include page="./sideBar.jsp" />
    
    <!-- CONTENT -->
    <section id="content">
        <jsp:include page="./navBar.jsp" />
        
        <!-- MAIN -->
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
                        <h3>1020</h3>
                        <p>New Orders</p>
                    </span>
                </li>
                <li>
                    <i class='bx bxs-group' ></i>
                    <span class="text">
                        <h3>2834</h3>
                        <p>Visitors</p>
                    </span>
                </li>
                <li>
                    <i class='bx bxs-dollar-circle' ></i>
                    <span class="text">
                        <h3>2543</h3>
                        <p>Total Sales</p>
                    </span>
                </li>
            </ul>

            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>Recent Orders</h3>
                        <i class='bx bx-search' ></i>
                        <i class='bx bx-filter' ></i>
                    </div>

                    <!-- Order Details Table -->
                    <table class="order-table">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer Name</th>
                                <th>Email</th>
                                <th>Total Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orderList}">
                                <tr>
                                    <td>${order.id}</td>
                                    
                                    <td>${order.firstName} ${order.lastName}</td>
                                    <td>${order.email}</td>
                                    <td>Rs${order.totalAmount}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${order.status == 1}">
                                                <span class="status-paid">Paid</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-unpaid">Unpaid</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- End of Order Details Table -->

                </div>
                
                
            </div>
        </main>
        <!-- MAIN -->
    </section>
    <!-- CONTENT -->

    <script src="./js/script.js"></script>
</body>
</html>

