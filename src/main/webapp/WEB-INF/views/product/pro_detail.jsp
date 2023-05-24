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
	  <h4 class="display-4"><c:out value="${categ_name }" /></h4>
	</div>
<div class="container">
	<div class="row">
  	<div class="col-md-6">
  		<img style="width:400px; height:400px" src="/product/displayImage?folderName=${productVO.p_up_folder }&fileName=${productVO.p_img }">
  	</div>
  	<div class="col-md-6">
  		<p class="my-0 font-weight-normal">상품명 : ${productVO.p_name }</p>
  		<p>가격: <fmt:formatNumber type="currency" pattern="￦#,###" value="${productVO.p_px }"/></p>
  		<p>제조사: ${productVO.p_mfr }</p>
  		<p>수량 : <input type="text" id="cart_amt" value="1" style="width: 50px;"></p>
		<button type="button" name="btn_fav" class="btn btn-link" data-p_no="${productVO.p_no }">찜하기</button>
		<button type="button" name="btn_cart" class="btn btn-link" data-p_no="${productVO.p_no }">장바구니</button>
		<button type="button" name="btn_direct_order" class="btn btn-link">바로구매</button>
  	</div>
  	<div>
			<ul class="nav nav-tabs text-center" id="productDetailTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="detail-tab" data-toggle="tab" data-target="#detail" type="button" role="tab" aria-controls="detail" aria-selected="true">상세정보</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="rev-tab" data-toggle="tab" data-target="#rev" type="button" role="tab" aria-controls="rev" aria-selected="false">상품후기</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="qna-tab" data-toggle="tab" data-target="#qna" type="button" role="tab" aria-controls="qna" aria-selected="false">Q&A</button>
				</li>
			</ul>
		</div>
		<div class="tab-content" id="productDetailTabContent">
		  <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab">
		  	${productVO.p_dtl }
		  </div>
		  <div class="tab-pane fade" id="rev" role="tabpanel" aria-labelledby="rev-tab">
		  	상품후기<br>
		  	${productVO.p_dtl }
		  </div>
		  <div class="tab-pane fade" id="qna" role="tabpanel" aria-labelledby="qna-tab">
				Q&A<br>
				${productVO.p_dtl }
		  </div>
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


	$("button[name='btn_cart']").on("click", function() {

		let p_no = $(this).data("p_no");
		let cart_amt = $("#cart_amt").val();

		$.ajax({
			url: '/cart/cart_add',
			type: 'post',
			data: {p_no : p_no, cart_amt : cart_amt},
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

		$('#productDetailTab button').on('click', function (event) {
		event.preventDefault()
		$(this).tab('show')
		});
	});
});
</script>
</html>