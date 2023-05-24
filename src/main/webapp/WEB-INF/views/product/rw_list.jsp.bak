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
    <title>Album example · Bootstrap v4.6</title>

<link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/album/">

    <!-- Bootstrap core CSS -->
<link href="https://getbootstrap.com/docs/4.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">


    <!-- Favicons -->
<link rel="apple-touch-icon" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="https://getbootstrap.com/docs/4.6/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.6/examples/album/album.css" rel="stylesheet">
  </head>
  <body>
    
<header>
	<!-- navbarHeader -->
	<%@include file="/WEB-INF/views/include/navbarHeader.jsp" %>
	<!-- navbar -->
	<%@include file="/WEB-INF/views/include/navbar.jsp" %>
</header>

<main role="main">

    <div class="container">
	    <div class="row justify-content-center">
	    <!-- categoryMenu -->
<%@include file="/WEB-INF/views/include/categoryMenu.jsp" %>
			</div>
    </div>

<div class="album py-5 bg-light">
  <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	  <h4 class="display-4">찜 목록</h4>
	</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div>
				<div class="box-header">
				</div>
			<!-- /.box-header -->
				<div>
					<table class="table table-hover">
					<tbody><tr>
						<th style="width: 60%">상품명</th>
						<th style="width: 10%">가격</th>
						<th style="width: 10%">할인율</th>
						<th style="width: 10%">판매여부</th>
						<th style="width: 10%">장바구니</th>
						<th style="width: 10%">삭제</th>
					</tr>
					<c:forEach items="${fav_list }" var="favDTO">      
					<tr>
						<td>
						<input type="hidden" name="fav_no" value="${favDTO.fav_no }">
						<a class="move" href="${favDTO.p_no}"><img src="/fav/displayImage?folderName=${favDTO.p_up_folder }&fileName=s_${favDTO.p_img }"></a>
						<a class="move" href="${favDTO.p_no}"><c:out value="${favDTO.p_name }" /></a>
						</td>
						<td><input type="text" name="p_px" value="${favDTO.p_px }" readonly></td>
						<td><input type="text" name="p_dc" value="${favDTO.p_dc }" readonly></td>
						<td>
							<select name="p_purchasable" disabled>
							  <option value="Y" ${favDTO.p_purchasable == 'Y' ? 'selected':''}>판매중</option>
							  <option value="N" ${favDTO.p_purchasable == 'N' ? 'selected':''}>품절</option>
							</select>
						</td>
						<td><button type="button" name="btn_add_cart" data-p_no="${favDTO.p_no }" class="btn btn-link">추가</button></td>
						<td><button type="button" name="btn_fav_del" class="btn btn-link">삭제</button></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row">
			<div class="col-md-12 text-center">
				<button type="button" id="btn_fav_empty" class="btn btn-light">찜목록 비우기</button>
				<button type="button" id="" class="btn btn-light">계속 쇼핑하기</button>
				<button type="button" id="" class="btn btn-dark">주문하기</button>
			</div>
			</div>
			<!-- /.box -->
		</div>
	</div>
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
  
</div>
  </div>

</main>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<!-- config -->
<%@include file="/WEB-INF/views/include/config.jsp" %>
  
  </body>
<script>
$(document).ready(function() {

	$("button[name='btn_add_cart']").on("click", function() {
		let p_no = $(this).data("p_no");

		$.ajax({
			url: '/fav/fav_add_cart',
			type: 'post',
			data: {p_no : p_no, cart_amt : 1},
			success : function(result) {
				if(result == 'success') {
					alert("장바구니에 추가되었습니다.");
					location.href = "/fav/fav_list"
				}
			}

		});

	});

	$("button[name='btn_fav_del']").on("click", function() {
		let fav_no = $(this).parent().parent().find("input[name='fav_no']").val();

		$.ajax({
			url: '/fav/fav_delete',
			type: 'post',
			data: {fav_no : fav_no},
			success : function(result) {
				if(result == 'success') {
					alert("삭제되었습니다.");
					location.href = "/fav/fav_list"
				}
			}

		});

	});

$("#btn_fav_empty").on("click", function() {
	if(!confirm("찜 목록을 비우시겠습니까?")) return;
	location.href="/fav/fav_empty"
	});

});
</script>
</html>
