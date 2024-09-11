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

        </head>

        <body>


            <jsp:include page="./sideBar.jsp" />


            <section id="content">
               
                <jsp:include page="./navBar.jsp" />


                <main>
                    <div class="head-title">
                        <div class="left">
                            <h1>Add New Offer</h1>
                            <ul class="breadcrumb">
                                <li>
                                    <a href="#">Dashboard</a>
                                </li>
                                <li><i class='bx bx-chevron-right'></i></li>
                                <li>
                                    <a class="active" href="#">Add Offer</a>
                                </li>
                            </ul>
                        </div>
                    </div>


                    <div class="form-container">
                        <form action="${pageContext.request.contextPath}/offer_index" method="post"
                            enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="offerDescription">Offer Description:</label>
                                <textarea class="form-control" id="offerDescription" name="description" rows="4"
                                    required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="offerImage">Offer Image:</label>
                                <input type="file" class="form-control" id="offerImage" name="offerImage"
                                    accept="image/*" required>
                            </div>
                            <button type="submit" class="btn-submit">Add a Offer</button>
                        </form>
                    </div>

                </main>


            </section>

            <script src="./js/script.js"></script>
        </body>

        </html>