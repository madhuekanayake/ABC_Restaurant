<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Reservation" %>
<%@ page import="com.res.dao.ReservationDAO" %>

<%
    ReservationDAO reservationDAO = new ReservationDAO();
    List<Reservation> confirmedReservations = reservationDAO.getConfirmedReservations();
    request.setAttribute("confirmedReservations", confirmedReservations);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" type="image/x-icon" href="./image/ABC_logo.jpg">
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
                <h1>Confirmed Reservations</h1>
                <ul class="breadcrumb">
                    <li><a href="#">Reservations</a></li>
                    <li><a href="#" class="active">Confirmed</a></li>
                </ul>
            </div>
        </div>

        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Confirmed Reservations</h3>
                    <i class='bx bx-search'></i>
                    <i class='bx bx-filter'></i>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Person</th>
                            <th>Branch</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="reservation" items="${confirmedReservations}">
                            <tr>
                                <td>${reservation.name}</td>
                                <td>${reservation.email}</td>
                                <td>${reservation.phone}</td>
                                <td>${reservation.date}</td>
                                <td>${reservation.time}</td>
                                <td>${reservation.person}</td>
                                <td>${reservation.branch}</td>
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