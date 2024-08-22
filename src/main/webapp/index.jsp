<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Gallery" %>
<%@ page import="com.res.dao.GalleryDAO" %>

<%
    // Fetch the product list from the database
    GalleryDAO galleryDAO = new GalleryDAO();
    List<Gallery> galleryList = galleryDAO.getAllGalleryImages();
    request.setAttribute("galleryList", galleryList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminArea/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminArea/css/style.css">

    <title>Gallery List</title>
</head>
<body>


<section id="content">
    <main>


       
                <table>
                    <thead>
                        <tr>
                          
                
             
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="gallery" items="${galleryList}">
                            <tr>
                             
                                <td><img src="${pageContext.request.contextPath}/${gallery.galleryImagePath}" alt="Gallery Image" width="50"></td>
                                <td>${gallery.description}</td>
                           
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</section>


</script>
</body>
</html>