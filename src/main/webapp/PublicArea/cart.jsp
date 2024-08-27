<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<body>
  <jsp:include page="./navBar.jsp" />
  <!-- END nav -->

 <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate text-center mb-4">
                <h1 class="mb-2 bread">Cart</h1>
                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Cart <i class="ion-ios-arrow-forward"></i></span></p>
            </div>
        </div>
    </div>
</section>
  <section class="ftco-section ftco-no-pt ftco-no-pb contact-section">
    <div class="container">
      <div class="row d-flex align-items-stretch no-gutters">
        <div class="col-md-12 pt-5 px-2 pb-2 p-md-5 order-md-last">
          <h2 class="h4 mb-2 mb-md-5 font-weight-bold">Your Cart</h2>
          <div class="table-responsive">
            <table class="table">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">Product Image</th>
                  <th scope="col">Product Name</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Subtotal</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="item" items="${cart.items}">
                  <tr>
                    <td><img src="${pageContext.request.contextPath}/${item.product.productImagePath}" alt="${item.product.name}" style="width: 100px;"></td>
                    <td>${item.product.name}</td>
                    <td>
                      <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="productId" value="${item.product.id}">
                        <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control form-control-sm" style="width: 60px; display: inline;">
                        <button type="submit" class="btn btn-outline-secondary btn-sm">Update</button>
                      </form>
                    </td>
                    <td>$${item.subtotal}</td>
                    <td>
                      <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="productId" value="${item.product.id}">
                        <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                      </form>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
              <tfoot>
                <tr>
                  <th colspan="3" class="text-right">Total:</th>
                  <th>$${cart.total}</th>
                  <th></th>
                </tr>
              </tfoot>
            </table>
          </div>

          <div class="d-flex justify-content-between">
            <a href="${pageContext.request.contextPath}/menu.jsp" class="btn btn-primary">Continue Shopping</a>
            <a href="${pageContext.request.contextPath}/checkout.jsp" class="btn btn-success">Proceed to Checkout</a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <jsp:include page="./footer.jsp" />

  <!-- ... (keep the existing scripts) ... -->
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>

</body>
</html>