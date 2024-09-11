<section id="sidebar">
    <a href="#" class="brand">
        <i class='bx bxs-smile'></i>
        <span class="text">Admin ABC</span>
    </a>
    <ul class="side-menu top">
        <li class="">
            <a href="./dashboard.jsp">
                <i class='bx bxs-dashboard'></i>
                <span class="text">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="./product_index.jsp">
                <i class='bx bx-restaurant'></i>

                <span class="text">Manage Products</span>
            </a>
        </li>
        <li>
            <a href="./gallery_index.jsp">
                <i class='bx bx-images'></i>

                <span class="text">Manage Gallary</span>
            </a>
        </li>
        <li>
            <a href="./facility_index.jsp">
                <i class='bx bx-hotel'></i>

                <span class="text">Manage Facilities</span>
            </a>
        </li>
        <li>
            <a href="./offer_index.jsp">
                <i class='bx bx-purchase-tag'></i>

                <span class="text">Manage Offers</span>
            </a>
        </li>

        <li>
            <a href="./staff_index.jsp">
                <i class='bx bx-user-plus'></i>

                <span class="text">Manage Staff</span>
            </a>
        </li>

        <li>
            <a href="./customer_index.jsp">
                <i class='bx bx-id-card'></i>

                <span class="text">View Customers</span>
            </a>
        </li>

        <li>
            <a href="./contact.jsp">
                <i class='bx bx-envelope'></i>
                <span class="text"> Queries</span>
            </a>
        </li>


    </ul>
    <ul class="side-menu">
        <li>
            <a href="./admin_login.jsp" class="logout" id="logout-link">
                <i class='bx bxs-log-out-circle'></i>
                <span class="text">Logout</span>
            </a>
        </li>

    </ul>
    <script>
        document.getElementById('logout-link').addEventListener('click', function (event) {
            var confirmation = confirm('Do you want to log out?');
            if (!confirmation) {
                event.preventDefault();
            }
        });
    </script>

</section>