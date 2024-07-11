<%-- 
    Document   : updateProducts
    Created on : Mar 10, 2024, 1:55:14 PM
    Author     : chien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
        <c:set var="p" value="${requestScope.pUp}"/>
        <form action="updateP" style="text-align: start; font-size: 150%" method="post" class="form">
            <h1>Update products</h1><br>

            <div><label> Enter id</label> <input type="text" readonly=""  name="idPu" value="${p.id}"></div><!-- không the sửa --><!-- thay vì disabled có thể chọn readonly tại dis không up được dữ liệu-->
            <div><label> Enter name</label> <input type="text" name="namePu" value="${p.name}"></div>
            <div><label> Enter quantity</label> <input type="number" name="quantityPu" value="${p.quantity}"></div>
            <div><label> Enter price</label> <input type="text" name="pricePu" value="${p.price}" "></div>
            <div><label> Enter releaseDate</label> <input type="date" name="datePu" value="${p.releaseDate}"></div>
            <div><label> Enter describe</label> <textarea type="text" name="describePu" style="height: 100px; width: 200px">${p.describe}</textarea></div>
            <div><label> Enter image</label> <input type="text" name="imagePu" value="${p.image}"></div>
            <div><label> Choose category</label>       
                <select name="cidUpdate">
                    <c:forEach var="c" items="${requestScope.listC}">
                        <option selected="${p.id}" value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
            </div>
            <input type="submit" value="UPDATE" style="margin-left: 150px;height: 40px; width: 120px; font-size: 25px; background-color: greenyellow; margin-left: 120px; margin-top: 50px"><br>
        </form>
    </body>
</html>
