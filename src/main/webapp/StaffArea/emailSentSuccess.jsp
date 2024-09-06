<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="icon" type="image/x-icon" href="./images/ABC_logo.jpg">
    <title>ABC Restaurant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        ._failed { border-bottom: solid 4px red !important; }
        ._failed i { color: red !important; }

        ._success {
            box-shadow: 0 15px 25px #00000019;
            padding: 45px;
            width: 100%;
            text-align: center;
            margin: 40px auto;
            border-bottom: solid 4px #28a745;
        }

        ._success i {
            font-size: 55px;
            color: #28a745;
        }

        ._success h2 {
            margin-bottom: 12px;
            font-size: 40px;
            font-weight: 500;
            line-height: 1.2;
            margin-top: 10px;
        }

        ._success p {
            margin-bottom: 20px;
            font-size: 18px;
            color: #495057;
            font-weight: 500;
        }

        .btn-ok {
            padding: 10px 30px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="message-box _success">
                    <i class="fa fa-check-circle" aria-hidden="true"></i>
                    <h2>Reply Sent To The Customer</h2>
                    
                    <button id="okButton" class="btn btn-success btn-ok">OK</button>
                </div>
            </div>
        </div>
        <hr>
    </div>

    <script>
        document.getElementById('okButton').addEventListener('click', function() {
            window.location.href = '${pageContext.request.contextPath}/StaffArea/contact.jsp';
        });
    </script>
</body>
</html>