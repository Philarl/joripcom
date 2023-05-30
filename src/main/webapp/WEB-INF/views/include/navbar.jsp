<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="navbar navbar-dark bg-dark shadow-sm">
  <div class="container d-flex justify-content-between">
    <a href="/" class="navbar-brand d-flex align-items-center">
      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
      <strong>Album</strong>
    </a>
    <c:if test="${sessionScope.loginStatus == null }">
	    <a href="/member/login">로그인</a>
      <a href="#" data-toggle="modal" data-target="#findIDModal">아이디 찾기</a>
      <a href="#" data-toggle="modal" data-target="#findPWModal">비밀번호 찾기</a>
	    <a href="/member/join">회원가입</a>
    </c:if>
    <c:if test="${sessionScope.loginStatus != null }">
    	<a href="/member/mypage">마이페이지</a>
      <a href="/product/rw_list">최근 본 상품</a>
      <c:if test="sessionScope.rwThumbnail != null">
        <a href="/product/pro_detail?p_no=${rwThumbnail.p_no}" class="text-center"><img style="width:60%; height:60%" src="/product/displayImage?folderName=${rwThumbnail.p_up_folder }&fileName=s_${rwThumbnail.p_img }"></a>
      </c:if>
      <a href="/fav/fav_list">찜 목록</a>
      <a href="/cart/cart_list">장바구니</a>
    	<a href="/member/logout">로그아웃</a>
    </c:if>
    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="findIDModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-md-12 mb-3">
              <label for="check_u_email">이메일</label>
              <input type="text" class="form-control" name="check_u_email" id="check_u_email" placeholder="가입할 때 사용한 이메일을 입력해주세요.">
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="btn_findID">아이디 찾기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="findPWModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="modal-body">
		  <div class="row">
			  <div class="col-md-12 mb-3">
				<label for="check_u_id">아이디</label>
				<input type="text" class="form-control" name="check_u_id" id="check_u_id" placeholder="가입할 때 사용한 아이디를 입력해주세요.">
			  </div>
			</div>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		  <button type="button" class="btn btn-primary" id="btn_findPW">비밀번호 찾기</button>
		</div>
	  </div>
	</div>
</div>
<!-- config -->
<%@include file="/WEB-INF/views/include/config.jsp" %>
<script>
	$(document).ready(function() {
		$("#btn_findID").on("click", function() {

			if($("#check_u_email").val() == "") {
				alert("이메일을 입력하세요.");
				$("#check_u_email").focus();
				return;
			}

			$.ajax({
				url: '/member/findID',
				type: 'post',
				data: {u_email : $("#check_u_email").val(), receiverMail : $("#check_u_email").val()},
        dataType: 'text',
        success: function(result) {
          if(result == "emailOff") {
            alert("해당 이메일로 가입한 아이디가 존재하지 않습니다.")
          }else if(result == "emailOn") {
            alert("아이디가 메일로 발송되었습니다. 메일을 확인해주세요.");
          }
        }
			});

      location.href = "/";
		});

		$("#btn_findPW").on("click", function() {

			if($("#check_u_id").val() == "") {
				alert("아이디를 입력하세요.");
				$("#check_u_id").focus();
				return;
			}

			$.ajax({
				url: '/member/findPW',
				type: 'post',
				data: {u_id : $("#check_u_id").val()},
        dataType: 'text',
        success: function(result) {
          if(result == "idOff") {
            alert("해당 아이디가 존재하지 않습니다.")
          }else if(result == "idOn") {
            alert("임시 비밀번호가 메일로 발송되었습니다. 메일을 확인해주세요.");
          }
        }
			});

      // location.href = "/";
		});
  });
</script>