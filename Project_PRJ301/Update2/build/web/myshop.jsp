<%-- 
    Document   : myshop
    Created on : Mar 13, 2024, 11:22:16 PM
    Author     : chien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            table{
                border-collapse: collapse;
            }
            #bag{
                text-align: right;
                margin-right: 20px;
                margin-top: 20px;
            }
            .tr{
                text-align: right;
            }
        </style>
    </head>
    <body>
        <p id="bag">
            <img src="images/giohang.jpg" width="50px" height="50px">
            <a href="show">Mybag(${requestScope.size}) items</a>
        </p>
        <h1>List of P shop</h1>
        <form name="" action="" method="post">
            Enter number of items to buy:
            <input style="text-align: center" type="number" name="num" value="1"/>
            <hr/>
            <table border="1px" style="border: 1px solid; width: 40%" width="40%">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${requestScope.data}" var="p">
                    <c:set var="id" value="${p.id}"/>
                    <tr>
                        <td>${id}</td>
                        <td>${p.name}</td>
                        <td class="tr">${p.quantity}</td>
                        <td class="tr"><fmt:formatNumber pattern="##.##" value="${(p.price*1.25)}"/></td>
                        <td><input type="button" onclick="buy('${id}')" value="Buy item"/></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </body>
</html>
<script type="text/javascript">
   function buy(id){
       var m =document.f.num.value;
       document.f.action="buy?id="+id+"&num="+m;
       document.f.submit();
   }
</script>