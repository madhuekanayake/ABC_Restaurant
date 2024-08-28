<section id="sidebar">
		<a href="#" class="brand">
			<i class='bx bxs-smile'></i>
			<span class="text">Staff ABC</span>
		</a>
		<ul class="side-menu top">
			<li class="">
				<a href="./dashboard.jsp">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li>
				<a href="./customer_reservation.jsp">
					<i class='bx bx-calendar-check'></i>
					<span class="text">Reservations </span>
				</a>
			</li>
			<li>
				<a href="./contact.jsp">
					<i class='bx bx-envelope'></i>
					<span class="text">Special Massages</span>
				</a>
			</li>
			<li>
				<a href="./reviews.jsp">
				<i class='bx bx-star'></i>
				<span class="text">Customer Reviews</span>
				</a>
			</li>
			<li>
				<a href="./orderList.jsp">
				<i class='bx bx-order'></i>
				<span class="text">Customer Orders</span>
				</a>
			</li>
			
			
		</ul>
		<ul class="side-menu">
			<li>
    <a href="./staff_login.jsp" class="logout" id="logout-link">
        <i class='bx bxs-log-out-circle'></i>
        <span class="text">Logout</span>
    </a>
</li>
			
		</ul>
		<script>
    document.getElementById('logout-link').addEventListener('click', function(event) {
        var confirmation = confirm('Do you want to log out?');
        if (!confirmation) {
            event.preventDefault(); // Prevents the default action (navigation) if the user cancels
        }
    });
</script>
		
	</section>