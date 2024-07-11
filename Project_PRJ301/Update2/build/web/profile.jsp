<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function togglePassword() {
                var passwordField = document.getElementById("passwordField");
                if (passwordField.type === "password") {
                    passwordField.type = "text";
                } else {
                    passwordField.type = "password";
                }
            }
        </script>
    </head>
    <body>      
        <div class="container-fluid" style="margin-left: 600px">
            <h1>Profile Account</h1>
            <h3>Id: ${requestScope.pro1.id}</h3>
            <h3>Username: ${requestScope.pro1.username}</h3>
            <h3>Password: <input id="passwordField" type="password" placeholder="Enter password" value="${requestScope.pro1.password}"><button onclick="togglePassword()">Show/Hide</button></h3>
            <h3>Amount : ${requestScope.pro1.amount}</h3>
            <div><a href="home" style="font-size: 30px">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="changepass" style="font-size: 30px">Change password</a></div>
          
        </div>
    </body>
</html>
