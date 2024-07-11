<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--logo, manaer, login--> 
<div class="container-xxl bg-white p-0">
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container-fluid">
            <a class=" d-flex flex-column align-items-center text-center  p-2 me-2" style="border:1px solid #00B98E; border-radius: 100px; background-color: #ffffff" href="http://localhost:9999/project/home" >
                <img style="border-radius:100px" src="images/logo.jpg" alt="Logo" height="50">
                <h5 class="m-0 text-primary" >Fruits Shop</h5>
            </a>


            <div class="navbar-nav ms-auto">
                <a href="home" class="nav-item nav-link active">Home</a>



                <c:if test="${sessionScope.acc.role==1}">
                    <a href="thongke" class="nav-item nav-link">Statistic</a>
                    <div class="nav-item dropdown">
                        <a href="products" class="nav-link " data-bs-toggle="dropdown">Manager Products</a>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="list" class="nav-link  " data-bs-toggle="dropdown">Manager Category</a>

                    </div>
                </c:if>






            </div>
            <div class="navbar-nav ms-auto" style="margin-top: 10px">
                <div class="d-flex m-3 me-0">

                    <a href="MyEcart.jsp" class="position-relative me-4 my-auto">
                        <i class="fa fa-shopping-bag fa-2x"></i>
                        <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">
                            ${empty sessionScope.cart ? '0' : sessionScope.size}    
                        </span>
                    </a>


                    <c:if test="${sessionScope.acc!=null}">
                        <div class="container-fluid">
                            <i><a class="fas fa-user fa-2x" href="profile?accc=${sessionScope.acc.username}"></a></i>                        
                            <a href="logout" class="logout-button" style="font-size: 30px">
                                <i class="fas fa-sign-out-alt"></i>
                            </a> <p style="font-size: 20px; color: #00B98E">Hello ${sessionScope.acc.username}</p></i> 
                        </div>
                    </c:if>

                    <c:if test="${sessionScope.acc==null}">
                        <a href="login" class="my-auto">
                            <i class="fas fa-user fa-2x"> </i> <a href="login" style="font-size: 20px">Login</a>
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
</div>

<!-- Navbar End -->
