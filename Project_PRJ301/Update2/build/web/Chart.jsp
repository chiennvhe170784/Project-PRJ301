<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Fruitables - Vegetable Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style_detail.css" rel="stylesheet">
</head>
<body>
    <%@include file="navbar_header.jsp" %>
    <div class="container page-header py-5" style="background-image: url('https://wallpapers.com/images/featured/green-background-ivfksvptao7sdhrg.jpg'); background-size: cover; background-position: center; background-repeat: no-repeat; display: flex; justify-content: center; align-items: center;">
        <h1 class="text-center text-md-center text-black-50 display-6" style="font-size: 80px">Shop Statistic</h1>
    </div>
    <div class="container" style="margin-top: 30px; font-size: 30px; background-color: #ffffff"><a href="home">Home</a> > <a href="#">Detail</a></div>
    <div id="chart-container" style="width:100%; max-width:600px; margin-top: 20px; margin-left: 300px">
        <div id="myChart" style="width:100%; height:500px;"></div>
    </div>
    <script>
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var jsonData = [
                ['Country', 'Mhl'],
                <c:forEach items="${requestScope.ListOrd}" var="orderDetail" varStatus="loop">
                    ['${orderDetail.pid}', ${orderDetail.quantity}]${!loop.last ? ',' : ''}
                </c:forEach>
            ];
            var data = google.visualization.arrayToDataTable(jsonData);
            var options = {
                title: 'Thống kê lượng sản phẩm đã bán'
            };
            var chart = new google.visualization.PieChart(document.getElementById('myChart'));
            chart.draw(data, options);
        }
    </script>
    <%@include file="footer.jsp" %>
</body>
</html>

