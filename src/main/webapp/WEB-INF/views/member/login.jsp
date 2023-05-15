<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  <section class="container">
  	<div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
        	<div class="card card-info">
	          <div class="card-header">
	            <h3 class="card-title">Horizontal Form</h3>
	          </div>
	          <!-- /.card-header -->
	          <!-- form start -->
	          <form class="form-horizontal" method="post" action="/member/login">
	            <div class="card-body">
	              <div class="form-group row">
	                <label for="u_id" class="col-sm-2 col-form-label">아이디</label>
	                <div class="col-sm-10">
	                  <input type="text" class="form-control" id="u_id">
	                </div>
	              </div>
	              <div class="form-group row">
	                <label for="u_pw" class="col-sm-2 col-form-label">비밀번호</label>
	                <div class="col-sm-10">
	                  <input type="password" class="form-control" id="u_pw">
	                </div>
	              </div>
	              <div class="form-group row">
	                <div class="offset-sm-2 col-sm-10">
	                  <div class="form-check">
	                    <input type="checkbox" class="form-check-input" id="exampleCheck2">
	                    <label class="form-check-label" for="exampleCheck2">Remember me</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <!-- /.card-body -->
	            <div class="card-footer">
	              <button type="submit" class="btn btn-info" id="btn_login">로그인</button>
	              <button type="submit" class="btn btn-default float-right">취소</button>
	            </div>
	            <!-- /.card-footer -->
	          </form>
	        </div>
        </div>
      </div>
    </div>
  </section>

</main>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<!-- config -->
<%@include file="/WEB-INF/views/include/config.jsp" %>
<script>

  $(document).ready(function() {

  });

</script>
  </body>
</html>
