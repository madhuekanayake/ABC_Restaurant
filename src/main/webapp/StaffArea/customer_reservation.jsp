<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <!-- My CSS -->
    <link rel="stylesheet" href="./css/style.css">

    <title>Product List</title>
</head>
<body>

<!-- Include Sidebar -->
<jsp:include page="./sideBar.jsp" />

<!-- CONTENT -->
<section id="content">
    <!-- Include Navbar -->
    <jsp:include page="./navBar.jsp" />

    <!-- MAIN -->
    <main>
        <div class="head-title">
            <div class="left">
                <h1>Customer List</h1>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">Customer</a>
                    </li>
                </ul>
            </div>
            
            

                
            </a>
        </div>

        <!-- Product Table -->
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
                            <th>Customer Name</th>
                            <th>Customer E mail</th>
                            <th>Customer OTP</th>
                            <th>Customer Verify Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Product 1</td>
                            
                            <td>mmm@gmail.com.</td>
                            <td>Product 1</td>
                            <td>mmm@gmail.com.</td>
                            
                            <td>
                                <button class="btn-edit">Edit</button>
                                <button class="btn-delete">Delete</button>
                            </td>
                        </tr>
                   
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <!-- CONTENT -->

</section>

<script src="./js/script.js"></script>
</body>
</html>