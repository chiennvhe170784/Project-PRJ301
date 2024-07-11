<%-- 
    Document   : home
    Created on : Feb 20, 2024, 11:22:00 AM
    Author     : chien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--bootstrap-->
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container">
            <div class="row">

                <div class="col-9 bg-primary" >
                    <h2 class="alert-primary">List of products <br><a href="home" style="color: #084298;font-size: 20px">Home</a> </h2>

                    <button class="btn-outline-info btn-plus"><a href="addP" style="color: #000">Add product</a></button>

                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Quatity</th>
                            <th>Price</th>
                            <th>Image</th>
                            <th>releaseDate</th>
                            <th>describe</th>
                            <th>Category</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach items="${requestScope.products}" var="p">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.name}</td>
                                <td>${p.quantity}</td>
                                <td>${p.price}</td>
                                <td>
                                    <img src="${p.image}" style="width: 50px;height: 50px"/>
                                </td>
                                <td>${p.releaseDate}</td>
                                <td>${p.describe}</td>
                                <td>${p.category.name}</td>
                                <td>
                                    <a href="updateP?pidUpdate=${p.id}" class="btn btn-success">Update</a>
                                    <a href="#" onclick="doDelete('${p.id}')" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

            </div>
        </div>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm('are U sure to delete id: ' + id + ' ?')) {
                    window.location = 'deleteP?pidDelete=' + id;
                }
            }
        </script>
    </body>
</html>
