<%-- 
    Document   : list
    Created on : Feb 19, 2024, 9:56:41 PM
    Author     : chien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="width: 50%;margin: 0 auto;background-color: #80dcc7">
            <h1>Categories</h1>
            <h4><a href="home">Home</a> </h4>
            <table border="1px" style="border-collapse: collapse;width: 100%">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Describe</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${requestScope.dataC}" var="c">
                    <c:set var="id" value="${c.id}"/>
                    <tr>
                        <td>${id}</td>
                        <td>${c.name}</td>
                        <td>${c.describe}</td>
                        <td>
                            <a href="update?id=${id}">Update</a>&nbsp;&nbsp;&nbsp;<!-- dùng thẻ a thì mặc định gọi đến doGet -->
                         
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        
    </body>
</html>
