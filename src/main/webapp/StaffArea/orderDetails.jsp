<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Head content -->
</head>
<body>
    <jsp:include page="./sideBar.jsp" />
      <link rel="icon" type="image/x-icon" href="./image/ABC_logo.jpg">
    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main>
            <div class="head-title">
                <!-- Head title content -->
            </div>

            <c:choose>
                <c:when test="${order != null}">
                    <div class="order-details">
                        <h2>Order #${order.id}</h2>
                        <!-- Customer Information -->
                        <!-- Order Information -->
                        <!-- Order Items -->
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="error-message">
                        <h2>Order not found</h2>
                        <p>The requested order details could not be found. Please try again or contact support.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </main>
    </section>
    <script src="./js/script.js"></script>
</body>
</html>