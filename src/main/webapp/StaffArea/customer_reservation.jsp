<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Reservation" %>
<%@ page import="com.res.dao.ReservationDAO" %>

<%
    ReservationDAO reservationDAO = new ReservationDAO();
    List<Reservation> reservationList = reservationDAO.getAllReservations();
    request.setAttribute("reservationList", reservationList);
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
    <style>
        

        .btn{
            background-color: #dc3545; /* Bootstrap's red color */
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            margin-left: 4px;
        }

        .btn-delete:hover {
            background-color: #c82333; 
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
                <h1>Reservation List</h1>
                <ul class="breadcrumb">
                    <li><a href="#">Reservations</a></li>
                </ul>
            </div>
            <a href="${pageContext.request.contextPath}/StaffArea/confirmed_reservations.jsp" class="btn-download">
                <span class="text">Confirmed Reservations</span>
            </a>
        </div>

        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Reservations</h3>
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
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="reservation" items="${reservationList}">
                <tr>
                    <td>${reservation.name}</td>
                    <td>${reservation.email}</td>
                    <td>${reservation.phone}</td>
                    <td>${reservation.date}</td>
                    <td>${reservation.time}</td>
                    <td>${reservation.person}</td>
                    <td>${reservation.branch}</td>
                    <td>${reservation.status == 0 ? 'Pending' : 'Confirmed'}</td>
                    <td>
                        <c:if test="${reservation.status == 0}">
                            <form action="${pageContext.request.contextPath}/confirmReservation" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${reservation.id}">
                                <button type="submit" class="btn" style="background-color: #00C000;"><i class='bx bx-check'></i></button>
                                
                                
                            </form>
                        </c:if>
                        <form action="${pageContext.request.contextPath}/deleteReservation" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${reservation.id}">
                            <button type="submit" class="btn"><i class='bx bx-trash'></i></button>
                        </form>
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
