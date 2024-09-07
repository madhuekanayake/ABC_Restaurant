<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Order" %>
<%@ page import="service.OrderService" %>
<%@ page import="service.CustomerService" %>
<%@ page import="service.StaffService" %>

<%
    OrderService orderService = new OrderService();
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
    <!-- ... existing head content ... -->
</head>
<body>
    <jsp:include page="./sideBar.jsp" />
    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main>
            <!-- ... existing content ... -->
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
                <li>
                   <i class='bx bxs-user-detail'></i>
                   
               <span class="text">
                        <h3>${totalStaff}</h3>
                        <p>Staff</p>
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
        
</body>
</html>