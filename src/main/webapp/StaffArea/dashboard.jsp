<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Order" %>
<%@ page import="service.OrderService" %>
<%@ page import="service.CustomerService" %>
<%@ page import="service.StaffService" %>


<%
    OrderService orderService = new OrderService();
    List<Order> orderList = orderService.getAllOrders();
    request.setAttribute("orderList", orderList);
    
    CustomerService customerService = new CustomerService();
    StaffService staffService = new StaffService();
    List<Order> allOrders = orderService.getAllOrders();
    List<Order> paidOrders = orderService.getPaidOrders();
    List<Order> unpaidOrders = orderService.getUnpaidOrders();
    double totalPaidAmount = orderService.getTotalPaidAmount();
    int totalCustomers = customerService.getTotalCustomerCount();
    int totalStaff = staffService.getTotalStaffCount();
    request.setAttribute("allOrders", allOrders);
    request.setAttribute("paidOrders", paidOrders);
    request.setAttribute("unpaidOrders", unpaidOrders);
    request.setAttribute("totalPaidAmount", totalPaidAmount);
    request.setAttribute("totalCustomers", totalCustomers);
    request.setAttribute("totalStaff", totalStaff);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" type="image/x-icon" href="./image/ABC_logo.jpg">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/other.css">
    <title>ABC Restaurant</title>
    <style>

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
                        <h3>${allOrders.size()}</h3>
                        <p>New Orders</p>
                    </span>
                </li>
                <li>
                    <i class='bx bxs-group' ></i>
                    <span class="text">
                        <h3>${totalCustomers}</h3>
                        <p>Customers</p>
                    </span>
                </li>
                <li>
                    <i class='bx bxs-dollar-circle' ></i>
                    <span class="text">
                        <h3>${totalPaidAmount}</h3>
                        <p>Total Amount</p>
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

