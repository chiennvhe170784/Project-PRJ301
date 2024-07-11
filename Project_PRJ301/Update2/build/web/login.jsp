<%-- 
    Document   : login
    Created on : Mar 5, 2024, 11:17:22 AM
    Author     : chien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="loginCss/logincss.css"/>
        <link href="loginCss/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <section class="h-100 gradient-form">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-lg-6" style="background-image: url(images/backgnound_login.jpg)">
                                    <div class="card-body p-md-5 mx-md-4">
                                        <div class="text-center">
                                            <img src="images/logo.jpg"
                                                 style="width: 185px;" alt="logo">
                                            <h4 class="mt-1 mb-5 pb-1">We are the BEST choice</h4>
                                        </div>

                                        <form style="margin-top: 70px" action="login" method="post">
                                            <p>Please login to your account</p>
                                            <p class="alert-danger" style="border-radius:10px; text-align: center">${requestScope.err}</p>
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form2Example11" >Username</label>
                                                <input type="text" id="form2Example11" class="form-control" name="user" value="${username}"
                                                       placeholder="Enter user name" />

                                            </div>

                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form2Example22">Password</label>
                                                <input type="password" id="form2Example22" class="form-control" value="${password}" placeholder="Enter password" name="pass"/>

                                            </div>
                                                <div><input type="checkbox" ${(cookie.remem eq 'ON')?"checked":""} name="rem" value="ON">Remember me</div>
                                            <div class="text-center pt-1 mb-5 pb-1">
                                                <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">Log
                                                    in</button>
                                                <a class="text-muted" href="changepass">Change password?</a>
                                            </div>

                                            <div class="d-flex align-items-center justify-content-center pb-4" style="margin-top: -20px" >
                                                <p class="mb-0 me-2">Don't have an account?</p>
                                                <a href="create1" class="btn btn-outline-light" role="button">Create new</a>

                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                    <div class="text-white px-3 py-4 p-md-5 mx-md-4 ">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"
                                             style="width: 385px; " alt="logo" >
                                        <h3 class="mb-4" style="text-align: justify; color: aqua" >Customer health comes first</h3>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
