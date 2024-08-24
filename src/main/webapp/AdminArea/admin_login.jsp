<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Admin" %>
<%@ page import="com.res.dao.AdminDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/admin_login.css" />
    <title>Sign in</title>
    <style>
        .error-message {
            color: #ff3333;
            background-color: #ffe6e6;
            border: 1px solid #ff3333;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 15px;
            text-align: center;
            width: 350px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <form action="/ABC_Restaurant/admin-login" method="post" class="sign-in-form">
                    <h2 class="title">Sign in</h2>
                    <% if(session != null && session.getAttribute("error") != null) { %>
                        <div class="error-message">
                            <%= session.getAttribute("error") %>
                        </div>
                        <% session.removeAttribute("error"); %> <!-- Remove the error after displaying it -->
                    <% } %>
                    
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" name="username" placeholder="Username" required />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Password" required />
                    </div>
                    <input type="submit" value="Sign In" class="btn solid" />
                </form>
            </div>
        </div>
        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content"></div>
                <img src="./assets/img/log.svg" class="image" alt="" />
            </div>
        </div>
    </div>
    <script src="app.js"></script>
</body>
</html>
