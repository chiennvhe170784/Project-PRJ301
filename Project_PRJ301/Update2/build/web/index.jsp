<%-- 
    Document   : home
    Created on : Feb 20, 2024, 10:54:58 AM
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


        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <script>
            function change() {

                document.getElementById("fCate").submit();
            }
        </script>
    </head>
    <body>

        <div class="container-xxl bg-white p-0">
            <%@include file="navbar_header.jsp" %>

            <!-- Header Start -->
            <div class="container-fluid row" style="margin-top: 100px">

                <div class="row bigevents" >
                    <div class="p-5 ">
                        <h1 class="display-5  mb-4"> <span class="text-primary">BIG EVENTS</span> <a href="#" style="text-decoration:underline;color: red ; font-size: 20px" >click here</a></h1>

                        <a href="" class="btn btn-warning py-3 px-4  ">Schedule</a>
                    </div>

                </div>

            </div>
            <!-- Header End -->


            <h1>${requestScope.acc.username}</h1>
            <!-- Search Start -->
            <div class="container-fluid mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px; background-color: #ccf1e8">
                <div class="container">

                    <div class="row g-2" >
                        <div class="col-md-10">

                            <form class="row g-2" id="fCate">
                                <div class="col-md-2">
                                    <select class="form-select border-0 py-3" name="cid">
                                        <option hidden value="0">Categories</option> 
                                        <c:forEach items="${requestScope.dataC}" var="c">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                        <option value="0">All</option>
                                    </select>
                                </div>
                                <div class="form-text col-md-3">
                                    Từ giá &nbsp;&nbsp;<input class="border-1" type="number" name="price1" style="padding-top: 5px">
                                    Đến giá <input class="border-1" type="number" name="price2" style="padding-top: 5px">
                                </div>
                                <div class="col-md-4">
                                    <input class="form-control border-1 py-3" type="text" placeholder="Nhập miêu tả" name="mieuta">
                                </div>
                                <div class="col-md-3">
                                    Từ ngày &nbsp;&nbsp;<input class="border-1" type="date" name="date1" style="padding-top: 5px"><br>
                                    Đến ngày <input class="border-1" type="date" name="date2" style="padding-top: 5px">
                                </div>
                                <!--                                <select name="12" class="form-select">
                                                                    <option>1</option>
                                                                    <option>2</option>
                                                                    <option>3</option>
                                                                </select>-->
                            </form>

                        </div>

                        <div class="col-md-2" onclick="change()">
                            <button class="btn btn-dark border-0 w-100 py-3">Search</button>
                        </div>
                    </div>

                    <div class="row g-3">
                        <div class="col-md-3 container">
                            <br/>
                            <ul class="navbar-nav form-control flex-column row" style="margin-top: 15px; background-color: #FFF">
                                <c:forEach items="${requestScope.dataC}" var="c">
                                    <button class="m-1 text-center" >
                                        <a href="home?cid=${c.id}" style="color: #000;margin-left: 30px" 
                                           class="nav-link">${c.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                    </button>

                                </c:forEach>
                                <button class="m-1 text-center" >
                                    <a href="home?cid=0" style="color: #000;margin-left: 30px" 
                                       class="nav-link">All&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                </button>
                            </ul>
                            <!--........ Tk.......... -->
                             <c:set var="nb" value="${requestScope.noibat}"/>
                             <div class="row" style="margin-top: 50px">
                                <h3>Sản phẩm bán chạy</h3>
                                <div class=" cat-item" style="margin-left: -10px">
                                            <div class="card m-2" style="border: 2px solid #fd7e14">
                                                <img src="${nb.image}" class="card-img" style="height:130px;width:auto;border-bottom: 2px solid #fd7e14">
                                            <div class="card-body border-0">
                                                <h5 class="card-title text-center">${nb.name}</h5>
                                                <p class="card-text text-center" >Giá gốc <span style="text-decoration: line-through; color: red">${nb.price*1.25}$</span>/1kg</p>
                                                <p class="card-text text-center">Sale: ${nb.price}$</p>
                                                <div class="text-center border-0">
                                                    <a href="detail?pid=${nb.id}" class="btn btn-secondary border border-secondary">Detail</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <c:set var="data" value="${requestScope.dataP}"/>
                            <h3 style="color: #198754;display: inline">&nbsp;Products (${data.size()})</h3> 
                            <div class="row  justify-content-center">
                                <c:forEach items="${requestScope.dataP}" var="p">
                                    <c:set value="${p.id}" var="pid"></c:set>
                                        <div class="col-md-4 cat-item">
                                            <div class="card m-2" style="border: 2px solid #fd7e14">
                                                <img src="${p.image}" class="card-img" style="height:130px;width:auto;border-bottom: 2px solid #fd7e14">
                                            <div class="card-body border-0">
                                                <h5 class="card-title text-center">${p.name}</h5>
                                                <p class="card-text text-center" >Giá gốc <span style="text-decoration: line-through; color: red">${p.price*1.25}$</span>/1kg</p>
                                                <p class="card-text text-center">Sale: ${p.price}$</p>
                                                <div class="text-center border-0">
                                                    <a href="detail?pid=${p.id}" class="btn btn-secondary border border-secondary">Detail</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <c:set var="page" value="${requestScope.page}"/>


                            <!-- Phần phân trang -->
                            <nav aria-label="...">
                                <c:if test="${totalPages > 1}">
                                    <ul class="pagination pagination-lg">
                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                            <li class="page-item"><a class="page-link" href="home?page=${i}">${i}</a></li>
                                            </c:forEach>
                                    </ul>
                                </c:if>
                            </nav>
                        </div>


                    </div>
                </div>
            </div>
            <!-- Search End -->

            <!-- Category Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                        <h1 class="mb-3">Property Types</h1>
                        <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>
                    </div>
                    <div class="row g-4">
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                            <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                                <div class="rounded p-4">
                                    <div class="icon mb-3">
                                        <img class="img-fluid" src="img/icon-apartment.png" alt="Icon">
                                    </div>
                                    <h6>Apartment</h6>
                                    <span>123 Properties</span>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                            <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                                <div class="rounded p-4">
                                    <div class="icon mb-3">
                                        <img class="img-fluid" src="img/icon-villa.png" alt="Icon">
                                    </div>
                                    <h6>Villa</h6>
                                    <span>123 Properties</span>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                            <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                                <div class="rounded p-4">
                                    <div class="icon mb-3">
                                        <img class="img-fluid" src="img/icon-house.png" alt="Icon">
                                    </div>
                                    <h6>Home</h6>
                                    <span>123 Properties</span>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                            <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                                <div class="rounded p-4">
                                    <div class="icon mb-3">
                                        <img class="img-fluid" src="img/icon-housing.png" alt="Icon">
                                    </div>
                                    <h6>Office</h6>
                                    <span>123 Properties</span>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                            <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                                <div class="rounded p-4">
                                    <div class="icon mb-3">
                                        <img class="img-fluid" src="img/icon-building.png" alt="Icon">
                                    </div>
                                    <h6>Building</h6>
                                    <span>123 Properties</span>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                            <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                                <div class="rounded p-4">
                                    <div class="icon mb-3">
                                        <img class="img-fluid" src="img/icon-neighborhood.png" alt="Icon">
                                    </div>
                                    <h6>Townhouse</h6>
                                    <span>123 Properties</span>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                            <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                                <div class="rounded p-4">
                                    <div class="icon mb-3">
                                        <img class="img-fluid" src="img/icon-condominium.png" alt="Icon">
                                    </div>
                                    <h6>Shop</h6>
                                    <span>123 Properties</span>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                            <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                                <div class="rounded p-4">
                                    <div class="icon mb-3">
                                        <img class="img-fluid" src="img/icon-luxury.png" alt="Icon">
                                    </div>
                                    <h6>Garage</h6>
                                    <span>123 Properties</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Category End -->


        </div>

        <!-- Footer Start -->
        <%@include file="footer.jsp" %>
        <!-- Footer End -->
    </body>
</html>
