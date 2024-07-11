<%-- 
    Document   : signup
    Created on : Mar 9, 2024, 4:09:16 PM
    Author     : chien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .form div {
                display: inline-block;
                margin-bottom: 5px; /* Thêm khoảng cách giữa các dòng */
            }
            .form div label {
                min-width: 150px;
            }
        </style>
    </head>
    <body>
        <form action="create1" method="post" style="text-align: start">
            <h1>Create new account</h1><br>
            <div><label> Enter username</label> <input type="text" name="user1"></div><br>
            <div><label> Enter password</label> <input type="password" name="pass1" style="margin-left: 5px;"></div><br>
            <div><label> Repeat password</label><input type="password" name="repass1"></div><br>

            <input type="submit" value="CREATE" style="margin-left: 150px;"><br>
            <div>   <a href="login">Login</a></div>
            <br><h3>${requestScope.output}</h3>
        </form>
    </body>
</html>

