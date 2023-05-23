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
	  <h4 class="display-4">장바구니</h4>
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
						<th style="width: 50%">상품명</th>
						<th style="width: 10%">수량</th>
						<th style="width: 10%">포인트</th>
						<th style="width: 10%">배송비</th>
						<th style="width: 10%">가격</th>
						<th style="width: 10%">취소</th>
					</tr>
					<c:forEach items="${cart_list }" var="cartListDTO">      
					<tr>
						<td>
						<input type="hidden" name="cart_no" value="${cartListDTO.cart_no }">
						<a class="move" href="${cartListDTO.p_no}"><img src="/cart/displayImage?folderName=${cartListDTO.p_up_folder }&fileName=s_${cartListDTO.p_img }"></a>
						<a class="move" href="${cartListDTO.p_no}"><c:out value="${cartListDTO.p_name }" /></a>
						</td>
						<td>
							<input type="text" name="cart_amt" value="${cartListDTO.cart_amt }">
							<button type="button" name="btn_cart_amt_change" class="btn btn-link">수량변경</button>
						</td>
						<td>포인트 : 0</td>
						<td>[기본배송조건]</td>
						<td><input type="text" name="p_px" value="${cartListDTO.p_px }" readonly></td>
						<td><button type="button" name="btn_cart_del" class="btn btn-link">삭제</button></td>
					</tr>
					</c:forEach>
					</tbody>
					<c:if test="${!empty cart_list}">
					<tfoot>
						<tr>
						<td colspan="6" class="text-right">총 구매금액 : <fmt:formatNumber type="currency" pattern="￦#,###" value="${cart_total_price }"/></td>
						</tr>
					</tfoot>
					</c:if>
					<c:if test="${empty cart_list}">
					<tfoot>
						<tr>
						<td colspan="6" class="text-center">[장바구니가 비었습니다.]</td>
						</tr>
					</tfoot>
					</c:if>
				</table>
			</div>
			<div class="row">
			<div class="col-md-12 text-center">
				<button type="button" id="btn_cart_empty" class="btn btn-light">장바구니 비우기</button>
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

	$("button[name='btn_cart_amt_change']").on("click", function() {
		let btn = $(this);
		let cart_no = btn.parent().parent().find("input[name='cart_no']").val();
		let cart_amt = btn.parent().find("input[name='cart_amt']").val();
		// console.log("카트 수량 변경 : " + cart_no + "/" + cart_amt);

		$.ajax({
			url: '/cart/cart_amount_change',
			type: 'post',
			data: {cart_no : cart_no, cart_amt : cart_amt},
			success : function(result) {
				if(result == 'success') {
					alert("수량이 변경되었습니다.");
					location.href = "/cart/cart_list"
				}
			}

		});

	});

	$("button[name='btn_cart_del']").on("click", function() {
		let cart_no = $(this).parent().parent().find("input[name='cart_no']").val();

		$.ajax({
			url: '/cart/cart_delete',
			type: 'post',
			data: {cart_no : cart_no},
			success : function(result) {
				if(result == 'success') {
					alert("삭제되었습니다.");
					location.href = "/cart/cart_list"
				}
			}

		});

	});

$("#btn_cart_empty").on("click", function() {
	if(!confirm("장바구니를 비우시겠습니까?")) return;
	location.href="/cart/cart_empty"
	});

});
</script>
</html>
