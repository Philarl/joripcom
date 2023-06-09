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
	  <h4 class="display-4">최근 본 상품</h4>
	</div>
<div class="container">
	<div class="row">
	  <div class="card-deck mb-3 text-center">
	    <c:forEach items="${rw_list }" var="rwDTO">
	    	<div class="col-md-3">
		      <div class="card mb-4 shadow-sm">
		        <div class="card-header">
		          <h4 class="my-0 font-weight-normal"><a class="move" href="${rwDTO.p_no }">상품명 : ${rwDTO.p_name }</a></h4>
		        </div>
		        <div class="card-body">
					<h5>가격: <fmt:formatNumber type="currency" pattern="￦#,###" value="${rwDTO.p_px }"/></h5>
					<a class="move" href="${rwDTO.p_no }"><img style="width:100px; height:67px" src="/product/displayImage?folderName=${rwDTO.p_up_folder }&fileName=s_${rwDTO.p_img }"></a>
					<button type="button" name="btn_fav" class="btn btn-link" data-p_no="${rwDTO.p_no }">찜하기</button>
					<button type="button" name="btn_cart" class="btn btn-link" data-p_no="${rwDTO.p_no }">장바구니</button>
					<button type="button" name="btn_direct_order" class="btn btn-link" data-p_no="${rwDTO.p_no }">바로구매</button>
		        </div>
		      </div>
	      </div>
	    </c:forEach>
	  </div>
  </div>
	<div class="row">
		<div class="col-md-12">
      <!-- 페이징 정보. Criteria 클래스 필드정보작업 -->
      <form id="actionForm" action="/product/rw_list" method="get">
		<!--
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" name="type" value="${pageMaker.cri.type}">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
        <input type="hidden" name="cat_code" id="cat_code" value="${cat_code}">
        <input type="hidden" name="categ_name" id="categ_name" value="${categ_name}">
         -->
      </form>
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

	let actionForm = $("#actionForm");

	$("a.move").on("click", function(e) {
		e.preventDefault();

		let p_no = $(this).attr("href");

		actionForm.find("input[name='p_no']").remove();
		actionForm.append("<input type='hidden' name='p_no' value='" + p_no + "'>");
		actionForm.attr("action", "/product/pro_detail");

		actionForm.submit();
	});

	$("button[name='btn_cart']").on("click", function() {

		let p_no = $(this).data("p_no");

		$.ajax({
			url: '/cart/cart_add',
			type: 'post',
			data: {p_no : p_no, cart_amt : 1},
			success : function(result) {

				// console.log("상품 번호 : " + p_no);

				alert("장바구니에 추가되었습니다.")
				if(confirm("장바구니로 이동하겠습니까?")) {
					location.href="/cart/cart_list";
				}
			}

		});
	});

	$("button[name='btn_fav']").on("click", function() {

		let p_no = $(this).data("p_no");

		$.ajax({
			url: '/fav/fav_add',
			type: 'post',
			data: {p_no : p_no},
			success : function(result) {

				// console.log("상품 번호 : " + p_no);

				alert("찜 목록에 추가되었습니다.")
				
			}

		});
	});

	$("button[name='btn_direct_order']").on("click", function() {

		let url = "/cart/direct_cart_add?p_no=" + $(this).data("p_no") + "&cart_amt=1";

		location.href = url;

	});

});
</script>
</html>