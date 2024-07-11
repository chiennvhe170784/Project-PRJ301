<%-- 
    Document   : MyEcart
    Created on : Mar 15, 2024, 3:19:23 PM
    Author     : chien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            a{
                text-decoration: none;
            }
            table{
                border-collapse: collapse;
            }
        </style>
    </head>
    <body>
        <h1>Shopping Cart</h1>
        <table border="1px" width="30%">
            <tr>
                <th>No</th>
                <th>Name</th>
                <th>quantity</th>
                <th>price</th>
                <th>money</th>
                <th>action</th>
            </tr>
            <c:set var="o" value="${sessionScope.cart}"/>
            <c:set var="t" value="0"/>
            <c:forEach items="${o.items}" var="i">
                <c:set var="t" value="${t+1}"/>
                <tr>
                    <td>${t}</td>
                    <td>${i.product.name}</td>
                    <td>
                        <button><a href="process?numBuy2=-1&idC2=${i.product.id}">-</a></button>
                        <input type="text" name="quantityBuyProduct" readonly value="${i.quantity}"/>
                        <button><a href="process?numBuy2=1&idC2=${i.product.id}">+</a></button>
                    </td>
                    <td><fmt:formatNumber pattern="##.#" value="${i.price}" /></td>
                    <td><fmt:formatNumber pattern="##.#" value="${i.quantity*i.price}" /></td>
                    <td>
                        <form action="process" method="post">
                            <input type="hidden" name="idC3" value="${i.product.id}"/>
                            <input type="submit" value="Return item"/>
                        </form>
                    </td>
                    
                </tr>
            </c:forEach>
            
            </table>
            <form action="checkout" method="post">
                <input type="submit" value="Check out"/>
            </form>
            <hr>
            <h2 style="color: chocolate"><a href="home">Click me</a></h2>
        </body>
    </html>
