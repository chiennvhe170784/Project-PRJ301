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

        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">


        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->



        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style_detail.css" rel="stylesheet">
    </head>
    <body>




        <!-- Navbar start -->
        <%@include file="navbar_header.jsp" %>
        <!-- Navbar End -->

        <div class="container page-header py-5" style="background-image: url('https://wallpapers.com/images/featured/green-background-ivfksvptao7sdhrg.jpg'); background-size: cover; background-position: center; background-repeat: no-repeat; display: flex; justify-content: center; align-items: center;">
            <h1 class="text-center text-md-center text-black-50 display-6" style="font-size: 80px">Shop Detail</h1>
        </div>

        <div class="container" style="margin-top: 30px; font-size: 30px; background-color: #ffffff"><a href="home">Home</a> > <a href="#">Detail</a></div>
        <!-- Single Product Start -->
        <div class="container py-5 mt-5" style="background-color: #ffffff">
            <!-- Single Page Header start -->

            <div class="container py-4">



                <div class="row ">
                    <div class="col-lg-6">
                        <div >
                            <a href="#">
                                <!--<img src="img/single-item.jpg" >-->
                                <img src="${PDetail.image}" class="img-fluid" style="height: 300px; width: auto" alt="Image"/> 
                            </a>
                        </div>
                    </div>
                    <form class="col-lg-6" name="f" action="detail" method="post" style="padding-left: 100px">
                        <h4 class="fw-bold mb-3">Sản phẩm : ${PDetail.name}</h4>
                        <p>Phân loại hàng : ${CDetail.name}</p>
                        <h5 class="fw-bold mb-3">${PDetail.price} $</h5>
                        <div class="d-flex mb-4">
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star text-secondary"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <p class="mb-4" style="text-align: justify">${CDetail.describe}</p>


                        <div class="input-group quantity mb-5" style="width: 100px;">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input id="quantityInput" type="text" class="form-control form-control-sm text-center border-0" value="1" name="numBuy">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>

<!--                        <button type="submit" onclick="buy('${PDetail.id}')" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary">
                            </i> Add to cart</button>-->
                        <button type="submit" onclick="buy('${PDetail.id}', document.getElementById('quantityInput').value)" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
                            <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                        </button>

                    </form>



                    <div class="col-lg-12">
                        <nav>
                            <div class="nav nav-tabs mb-3">
                                <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                        id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                        aria-controls="nav-about" aria-selected="true">Description</button>
                            </div>
                        </nav>
                        <div class="tab-content md-6">
                            <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                <p>${PDetail.describe}</p>

                                <div class="px-2">
                                    <div class="row g-4">
                                        <div class="col-md-6" style="border: 1px solid">

                                            <div class="row text-center align-items-center justify-content-center py-2">
                                                <div class="col-6">
                                                    <p class="mb-0">More detail</p>
                                                </div>

                                            </div>

                                            <div class="row bg-light align-items-center text-center justify-content-center py-2">
                                                <div class="col-6" style="border-right: 1px solid">
                                                    <p class="mb-0">Số lượng hiện có</p>
                                                </div>
                                                <div class="col-6">
                                                    <p class="mb-0">${PDetail.quantity}</p>
                                                </div>
                                            </div>

                                            <div class="row text-center align-items-center justify-content-center py-2">
                                                <div class="col-6" style="border-right: 1px solid">
                                                    <p class="mb-0">Ngày thu hoạch</p>
                                                </div>
                                                <div class="col-6">
                                                    <p class="mb-0">${PDetail.releaseDate}</p>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                </div>






            </div>
        </div>
        <!-- Single Product End -->



        <!-- footer -->
        <%@include file="footer.jsp" %>


        <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
    const minusBtn = document.querySelector('.btn-minus');
    const plusBtn = document.querySelector('.btn-plus');
    const quantityInput = document.getElementById('quantityInput');

    minusBtn.addEventListener('click', function (event) {
        event.preventDefault(); // Ngăn chặn hành vi mặc định của nút
        const currentValue = parseInt(quantityInput.value) || 1;
        quantityInput.value = currentValue > 1 ? currentValue - 1 : 1;
    });

    plusBtn.addEventListener('click', function (event) {
        event.preventDefault(); // Ngăn chặn hành vi mặc định của nút
        const currentValue = parseInt(quantityInput.value) || 0;
        quantityInput.value = currentValue + 1;
    });
});

function buy(id, numBuy) {
    document.f.numBuy.value = numBuy;
    document.f.action = "detail?id=" + id + "&num=" + numBuy;
    document.f.submit();
}

        </script>

    </body>
</html>
