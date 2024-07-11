<%-- 
    Document   : addProduct
    Created on : Mar 10, 2024, 1:55:35 PM
    Author     : chien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .form {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
            }
            .form div {
                display: flex;
                align-items: center;
                margin-bottom: 5px; /* Thêm khoảng cách giữa các dòng */
            }
            .form div label {
                min-width: 150px;
                margin-right: 50px;
            }
        </style>
    </head>
    <body>
        <form action="addP" style="text-align: start; font-size: 150%" class="form">
            <h1>Add products</h1><br>
            <div><label> Enter id</label> <input type="text"  name="idP"></div><!-- không the sửa -->
            <div><label> Enter name</label> <input type="text" name="nameP"></div>
            <div><label> Enter quantity</label> <input type="number" name="quantityP"></div>
            <div><label> Enter price</label> <input type="number" name="priceP"></div>
            <div><label> Enter releaseDate</label> <input type="date" name="dateP"></div>
            <div><label> Enter describe</label> <textarea type="text" name="describeP"></textarea></div>
            <div><label> Enter image</label> <input type="text" name="imageP"></div>
            <div><label> Choose category</label>       
                <select name="cidAdd">
                    <c:forEach var="c" items="${requestScope.listC}">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
            </div>
            <input type="submit" value="ADD" style="margin-left: 150px;height: 40px; width: 70px; font-size: 25px; background-color: greenyellow; margin-left: 120px; margin-top: 50px"><br>
        </form>
                    <h3>${requestScope.err}</h3>
    </body>
</html>
