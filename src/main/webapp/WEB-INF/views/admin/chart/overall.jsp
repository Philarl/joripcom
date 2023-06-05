<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Dashboard Template · Bootstrap v4.6</title>
<!-- config -->
<%@include file="/WEB-INF/views/admin/include/config.jsp" %>
  </head>
  <body>
<!-- navbar -->
<%@include file="/WEB-INF/views/admin/include/navbar.jsp" %>    

<div class="container-fluid">
  <div class="row">
    <!-- sidebarMenu -->
<%@include file="/WEB-INF/views/admin/include/sidebarMenu.jsp" %>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
      <section class="content container-fluid">
        <!--------------------------
          | Your Page Content Here |
          -------------------------->
        <div class="row">
          <div class="col-md-12">
            <div class="box">
              <div class="box-body table-responsive no-padding">
                <table class="table table-hover">
                  <tbody><tr>
                    <th style="width: 2%;">
                    1차 카테고리 주문통계
                    </th>
                  </tr>     
                  <tr>
                    <td>
                    <div id="firstCategoryChart"></div>
                    </td>
                  </tr></tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
  </div>
</div>

<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

  // Load the Visualization API and the corechart package.
  google.charts.load('current', {'packages':['corechart']});

  // Set a callback to run when the Google Visualization API is loaded.
  google.charts.setOnLoadCallback(drawChart);

  // Callback that creates and populates a data table,
  // instantiates the pie chart, passes in the data and
  // draws it.
  function drawChart() {

    // 2차원 배열 형태의 String으로 차트 구현
    // var data = new google.visualization.arrayToDataTable(${firstCategoryData});

    //데이터 배열을 JSON으로 보내 ajax로 차트 구현
    let categoryData = $.ajax({
      url: '/admin/chart/firstCategoryOrderPrice',
      type: 'get',
      dataType: 'json',
      async:false
    }).responseText;

    // console.log("categoryData: " + categoryData);

    // Create the data table.
    var data = new google.visualization.DataTable(categoryData);
    

    // Set chart options
    var options = {'title':'1차 카테고리별 주문금액',
                   'width':500,
                   'height':300};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart(document.getElementById('firstCategoryChart'));
    chart.draw(data, options);
  }
</script>

<script>
  $(document).ready(function() {

 });
</script>

  </body>
</html>


