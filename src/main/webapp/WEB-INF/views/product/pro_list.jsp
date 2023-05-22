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
	  <div class="card-deck mb-3 text-center">
	    <c:forEach items="${pro_list }" var="productVO">
	    	<div class="col-md-3">
		      <div class="card mb-4 shadow-sm">
		        <div class="card-header">
		          <h4 class="my-0 font-weight-normal"><a class="move"" href="${productVO.p_no }">상품명 : ${productVO.p_name }</a></h4>
		        </div>
		        <div class="card-body">
		          <h5>가격: <fmt:formatNumber type="currency" pattern="￦#,###" value="${productVO.p_px }"/></h5>
		          <!-- 
		          <ul class="list-unstyled mt-3 mb-4">
		            <li>10 users included</li>
		            <li>2 GB of storage</li>
		            <li>Email support</li>
		            <li>Help center access</li>
		          </ul>
		           -->
		           <a class="move" href="${productVO.p_no }"><img style="width:100px; height:67px" src="/product/displayImage?folderName=${productVO.p_up_folder }&fileName=s_${productVO.p_img }"></a>
		          <button type="button" name="btn_cart" class="btn btn-link" data-p_no="${productVO.p_no}">장바구니</button>
		          <button type="button" name="btn_direct_order" class="btn btn-link">바로구매</button>
		        </div>
		      </div>
	      </div>
	    </c:forEach>
	  </div>
  </div>
	<div class="row">
		<div class="col-md-12">
	    <ul class="pagination justify-content-end">
	      <c:if test="${pageMaker.prev}">
	      	<li class="page-item"><a class="page-link" href="${pageMaker.startPage - 1}">«</a></li>
	      </c:if>
	      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
	         <!-- li 다음에 ${pageMaker.cri.pageNum == pageNum ? "active" : ""} -->
	      	<li class="page-item" ${pageMaker.cri.pageNum == pageNum ? "class='active'" : ""}><a class="page-link" href="${pageNum}">${pageNum }</a></li>
	      </c:forEach>
	      <c:if test="${pageMaker.next}">
	      	<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}">»</a></li>
	      </c:if>
	    </ul>
      <!-- 페이징 정보. Criteria 클래스 필드정보작업 -->
      <form id="actionForm" action="/product/pro_list" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <!-- 
        <input type="hidden" name="type" value="${pageMaker.cri.type}">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
         -->
        <!-- 
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
</html>
