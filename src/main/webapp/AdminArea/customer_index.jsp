<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Customer" %>
<%@ page import="com.res.dao.CustomerDAO" %>

<%
    // Fetch the offer list from the database
    CustomerDAO customerDAO = new CustomerDAO();
    List<Customer> customerList = customerDAO.getAllCustomers();
    request.setAttribute("customerList", customerList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/style.css">
    <title>ABC Restaurant</title>
</head>
<body>

<jsp:include page="./sideBar.jsp" />

<section id="content">
    <jsp:include page="./navBar.jsp" />

    <main>
        <div class="head-title">
            <div class="left">
                <h1>Customer List</h1>
                <ul class="breadcrumb">
                    <li><a href="#">Customers</a></li>
                </ul>
            </div>
        </div>

        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Customer</h3>
                    <i class='bx bx-search'></i>
                    <i class='bx bx-filter'></i>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Customer Name</th>
                            <th>Email</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="customer" items="${customerList}">
                            <tr>
                                <td>${customer.id}</td>
                                <td>${customer.username}</td>
                                <td>${customer.email}</td>
                                
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