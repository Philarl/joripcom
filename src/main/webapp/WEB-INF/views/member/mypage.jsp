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

  <section class="container">
  	<div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
	          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">마이페이지</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form>
                <div class="card-body">
                  <div class="form-group row">
                    <div class="col-md-4 mb-3">
                      <label for="u_id">아이디</label>
                      <input type="text" class="form-control" name="u_id" id="u_id" value="<c:out value='${memberVO.u_id }' />" readonly>
                    </div>
                    <div class="col-md-4 mb-3">
                      <label for="u_name">이름</label>
                      <input type="text" class="form-control" name="u_name" id="u_name" value="<c:out value='${memberVO.u_name }' />" readonly>
                    </div>
                    <div class="col-md-4 mb-3">
                      <label for="u_email">이메일</label>
                      <input type="email" class="form-control" name="u_email" id="u_email" value="<c:out value='${memberVO.u_email }' />" readonly>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-md-3 mb-3">
                      <label for="sample2_postcode">우편번호</label>
                      <input type="text" class="form-control" name="u_zipcode" id="sample2_postcode" value="<c:out value='${memberVO.u_zipcode }' />" readonly>
                    </div>
                    <div class="col-md-4 mb-3">
                      <label for="sample2_address">주소</label>
                      <input type="text" class="form-control" name="u_addr" id="sample2_address" value="<c:out value='${memberVO.u_addr }' />" readonly>
                    </div>
                    <div class="col-md-5 mb-3">
                      <label for="sample2_detailAddress">상세주소</label>
                      <input type="text" class="form-control" name="u_addr_dtl" id="sample2_detailAddress" value="<c:out value='${memberVO.u_addr_dtl }' />" readonly>
                      <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-md-4 mb-3">
                      <label for="u_phone">전화번호</label>
                      <input type="text" class="form-control" name="u_phone" id="u_phone" value="<c:out value='${memberVO.u_phone }' />" readonly>
                    </div>
                    <div class="col-md-4 mb-3">
                      <label for="u_nic">닉네임</label>
                      <input type="text" class="form-control" name="u_nic" id="u_nic" value="<c:out value='${memberVO.u_nic }' />" readonly>
                    </div>
                    <div class="col-md-4 mb-3">
                      <label for="join_date">가입일</label>
                      <input type="text" class="form-control" name="join_date" id="join_date" value="<fmt:formatDate value='${memberVO.join_date }' pattern="yyyy-MM-dd" />" readonly>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" class="btn btn-primary" id="btn_modify">회원정보 수정</button>
                  <c:if test="${sessionScope.kakaoLoginStatus == null}">
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#pwchangeModal">비밀번호 변경</button>
                  </c:if>
                  <c:if test="${sessionScope.kakaoLoginStatus == null}">
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteModal">회원 탈퇴</button>
                  </c:if>
                  <c:if test="${sessionScope.kakaoLoginStatus != null}">
                  <button type="button" class="btn btn-primary" id="btn_kakao_delete">회원 탈퇴</button>
                  </c:if>
                </div>
              </form>
            </div>
        </div>
      </div>
    </div>
  </section>
</main>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<!-- Modal -->
<div class="modal fade" id="pwchangeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-md-4 mb-3">
              <label for="old_u_pw">기존비밀번호</label>
              <input type="password" class="form-control" id="old_u_pw">
            </div>
            <div class="col-md-4 mb-3">
              <label for="new_u_pw">신규비밀번호</label>
              <input type="password" class="form-control" id="new_u_pw">
            </div>
            <div class="col-md-4 mb-3">
              <label for="new2_u_pw">비밀번호확인</label>
              <input type="password" class="form-control" id="new2_u_pw">
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="btn_pwchange">변경</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="modal-body">
		  <div class="row">
			  <div class="col-md-12 mb-3">
				<label for="check_u_pw">비밀번호확인</label>
				<input type="password" class="form-control" id="check_u_pw">
			  </div>
			</div>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		  <button type="button" class="btn btn-primary" id="btn_delete">탈퇴</button>
		</div>
	  </div>
	</div>
</div>

<!-- config -->
<%@include file="/WEB-INF/views/include/config.jsp" %>

<script>
	$(document).ready(function() {

    // console.log('${sessionScope.loginStatus}');
    // console.log('${sessionScope.kakaoLoginStatus}');

		$("#btn_pwchange").on("click", function() {

			if($("#new_u_pw").val() != $("#new2_u_pw").val()) {
				alert("신규비번이 일치하지 않습니다.");
				return;
			}

			$.ajax({
				url: '/member/pwchange',
				type: 'post',
				data: {old_u_pw : $("#old_u_pw").val(), new_u_pw : $("#new_u_pw").val()},
				dataType: 'text',
				success: function(result) {
					if(result == "success") {
						alert("비밀번호 변경이 되었습니다.");
						$("#old_u_pw").val('');
						$("#new_u_pw").val('');
						$("#new2_u_pw").val('');

						$('#pwchangeModal').modal('hide');
					}else if(result == "failPW") {
						alert("기존비밀번호가 틀립니다. \n확인바랍니다.");
						$("#old_u_pw").val('');
						$("#old_u_pw").focus();
					}
				}
			});
		});

		$("#btn_delete").on("click", function() {

			if($("#check_u_pw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#check_u_pw").focus();
				return;
			}

			$.ajax({
				url: '/member/delete',
				type: 'post',
				data: {u_pw : $("#check_u_pw").val()},
				dataType: 'text',
				success: function(result) {
					if(result == "delete") {
						alert("회원탈퇴가 완료되었습니다.");

						$('#deleteModal').modal('hide');
						location.href="/"
					}else if(result == "failPW") {
						alert("비밀번호가 틀립니다. \n확인바랍니다.");
						$("#check_u_pw").val('');
						$("#check_u_pw").focus();
					}
				}
			});
		});

		$("#btn_modify").click(function() {
			location.href = "/member/modify";
		});

    $("#btn_kakao_delete").on("click", function() {

      if(!confirm("회원탈퇴하시겠습니까?")) return;

      $.ajax({
        url: '/member/delete',
        type: 'post',
        data: {},
        dataType: 'text',
        success: function(result) {
          if(result == "delete") {
            alert("회원탈퇴가 완료되었습니다.");
          }
        }
      });

      location.href = "/";
    });
	});
</script>
  </body>
</html>
