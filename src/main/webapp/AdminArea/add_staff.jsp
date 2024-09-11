<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="icon" type="image/x-icon" href="./assets/img/ABC_logo.jpg">


            <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

            <link rel="stylesheet" href="./css/style.css">
            <link rel="stylesheet" href="./css/other.css">

            <title>ABC Restaurant</title>


        <body>

            <jsp:include page="./sideBar.jsp" />


            <section id="content">
                <jsp:include page="./navBar.jsp" />


                <main>
                    <div class="head-title">
                        <div class="left">
                            <h1>Add New Staff Member</h1>
                            <ul class="breadcrumb">
                                <li>
                                    <a href="#">Dashboard</a>
                                </li>
                                <li><i class='bx bx-chevron-right'></i></li>
                                <li>
                                    <a class="active" href="#">Add Staff</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="form-container">
                        <form action="${pageContext.request.contextPath}/staff" method="post"
                            enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="form-group">
                                <label for="profileImage">Profile Image:</label>
                                <input type="file" class="form-control" id="profileImage" name="profileImage"
                                    accept="image/*" required>
                            </div>
                            <button type="submit" class="btn-submit">Add a Staff Member</button>
                        </form>
                    </div>
                </main>

            </section>


            <script src="./js/script.js"></script>
        </body>

        </html>