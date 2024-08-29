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
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/style.css">
    <title>Customer Orders</title>
</head>
<body>
    <jsp:include page="./sideBar.jsp" />
    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Customer Orders</h1>
                    <ul class="breadcrumb">
                        <li><a href="#">Customer Orders</a></li>
                    </ul>
                </div>
            </div>
            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>Customer Orders</h3>
                        <i class='bx bx-search'></i>
                        <i class='bx bx-filter'></i>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer Name</th>
                                <th>Email</th>
                                <th>Total Amount</th>
                                <th>Order Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orderList}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${order.firstName} ${order.lastName}</td>
                                    <td>${order.email}</td>
                                    <td>Rs${order.totalAmount}</td>
                                    <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>
    <a href="${pageContext.request.contextPath}/StaffArea/orderDetails?id=${order.id}" class="btn-view">View</a>
</td>
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
